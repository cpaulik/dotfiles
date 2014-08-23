;; setup standard org notes file
(require 'org)
(setq org-default-notes-file "~/Dropbox/Arbeit/organisation/notes.org")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(require-package 'org-ac)
(require 'org-ac)
(org-ac/config-default)

;; any headline with level <= 2 is a target
(setq org-refile-targets '((nil :maxlevel . 2)
                                ; all top-level headlines in the
                                ; current buffer are used (first) as a
                                ; refile target
                           (org-agenda-files :maxlevel . 2)))

;; provide refile targets as paths, including the file name
;; (without directory) as level 1 of the path
(setq org-refile-use-outline-path 'file)

;; allow to create new nodes (must be confirmed by the user) as
;; refile targets
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; refile only within the current buffer
(defun my/org-refile-within-current-buffer ()
  "Move the entry at point to another heading in the current buffer."
  (interactive)
  (let ((org-refile-targets '((nil :maxlevel . 5))))
    (org-refile)))
;; enable helm org refile into subsection of agenda file
(setq org-outline-path-complete-in-steps nil)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}
\\usepackage[latin1]{inputenc}
\\usepackage{tabulary}"
               ("\\section{%s}" . "\\section*{%s}")))
(provide 'org_config)
