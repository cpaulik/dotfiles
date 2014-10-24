(defvar jekyll-directory (expand-file-name "~/workspace/website/org/")
  "Path to Jekyll blog.")
(defvar jekyll-drafts-dir "_drafts/"
  "Relative path to drafts directory.")
(defvar jekyll-posts-dir "_posts/"
  "Relative path to posts directory.")
(defvar jekyll-post-ext ".org"
  "File extension of Jekyll posts.")
(defvar jekyll-post-template
  "#+BEGIN_HTML\n---\nlayout: post\ntitle: %s\nexcerpt: \ncategories:\n  -  \ntags:\n  -  \n---\n#+END_HTML\n\n* "
  "Default template for Jekyll posts. %s will be replace by the post title.")

(defun jekyll-make-slug (s)
  "Turn a string into a slug."
  (replace-regexp-in-string
   " " "-" (downcase
            (replace-regexp-in-string
             "[^A-Za-z0-9 ]" "" s))))

(defun jekyll-yaml-escape (s)
  "Escape a string for YAML."
  (if (or (string-match ":" s)
          (string-match "\"" s))
      (concat "\"" (replace-regexp-in-string "\"" "\\\\\"" s) "\"")
    s))

(defun jekyll-draft-post (title)
  "Create a new Jekyll blog post."
  (interactive "sPost Title: ")
  (let ((draft-file (concat jekyll-directory jekyll-drafts-dir
                            (jekyll-make-slug title)
                            jekyll-post-ext)))
    (if (file-exists-p draft-file)
        (find-file draft-file)
      (find-file draft-file)
      (insert (format jekyll-post-template (jekyll-yaml-escape title))))))

(defun jekyll-publish-post ()
  "Move a draft post to the posts directory, and rename it so that it
 contains the date."
  (interactive)
  (cond
   ((not (equal
          (file-name-directory (buffer-file-name (current-buffer)))
          (concat jekyll-directory jekyll-drafts-dir)))
    (message "This is not a draft post."))
   ((buffer-modified-p)
    (message "Can't publish post; buffer has modifications."))
   (t
    (let ((filename
           (concat jekyll-directory jekyll-posts-dir
                   (format-time-string "%Y-%m-%d-")
                   (file-name-nondirectory
                    (buffer-file-name (current-buffer)))))
          (old-point (point)))
      (rename-file (buffer-file-name (current-buffer))
                   filename)
      (kill-buffer nil)
      (find-file filename)
      (set-window-point (selected-window) old-point)))))

(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs
   (format "../assets/article_images/%s" path)))

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"/assets/article_images/%s\" alt=\"%s\"/>" path desc))))

(defun org-custom-link-header-img-follow (path)
  (org-open-file-with-emacs
   (format "../assets/header_images/%s" path)))

(defun org-custom-link-header-img-export (path desc form)
  (cond
   ((eq form 'html)
    (format "" ))))
(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)
(org-add-link-type "header-img" 'org-custom-link-header-img-follow 'org-custom-link-header-img-export)
(setq org-publish-project-alist
      '(("jekyll-cpaulik-github-io" ;; settings for cute-jumper.github.io
         :base-directory "~/workspace/website/org/"
         :base-extension "org"
         :publishing-directory "~/workspace/website/cpaulik.github.io"
         :recursive t
	 :exclude-tags "noblogexport"
	 :section-numbers nil
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :headline-levels 4
         :auto-preamble nil
         :auto-sitemap nil
         :html-extension "html"
         :body-only t)))

(add-to-list 'org-publish-project-alist
             `("cp-img"
               :base-directory "~/workspace/website/org/"
               :recursive t
               :exclude "^publish"
               :base-extension "jpg\\|gif\\|png"
	       :publishing-directory "~/workspace/website/cpaulik.github.io"
               :publishing-function org-publish-attachment))
(add-to-list 'org-publish-project-alist
             '("cp-blog" :components ("jekyll-cpaulik-github-io"
                                 "cp-img")))
(provide 'org_jekyll)
