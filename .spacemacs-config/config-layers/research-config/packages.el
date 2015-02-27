;;; packages.el --- research-config Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar research-config-packages
  '(
    ;; package research-configs go here
    parsebib
    helm-bibtex
    reftex
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar research-config-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function research-config/init-<package-research-config>
;;
(defun research-config/init-helm-bibtex()
   "Initialize my package"
   (setq helm-bibtex-bibliography "~/Dropbox/Arbeit/Papers/bibliography.bib")
   (setq helm-bibtex-library-path "~/Dropbox/Arbeit/Papers/pdf")
   (setq helm-bibtex-notes-path "~/Dropbox/Arbeit/Papers/notes")
   (setq helm-bibtex-notes-extension ".org")
   (setq helm-bibtex-pdf-open-function
     (lambda (fpath)
       (start-process "evince" "*evince*" "evince" fpath)))
   (setq helm-bibtex-format-citation-functions
      (quote
       ((org-mode . helm-bibtex-format-citation-cite)
        (latex-mode . helm-bibtex-format-citation-cite)
        (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
        (default . helm-bibtex-format-citation-default))))

   (setq helm-bibtex-additional-search-fields '(keywords journal))
   (evil-leader/set-key "or" 'helm-bibtex)

   ;; setup org-ref
;;;;;;; org path for loadable org-files
(defvar org-load-path '("~/dotfiles/.spacemacs-config/org-ref/"))

(defun org-require (feature)
  "Load a FEATURE from an org-file.
FEATURE is a symbol, and it is loaded from an org-file by the name of FEATURE.org, that is in the `org-load-path'.  The FEATURE is loaded from `org-babel-load-file'."
  (let ((org-file (concat (symbol-name feature) ".org"))
	(path))

    ;; find the org-file
    (catch 'result
      (loop for dir in org-load-path do
	    (when (file-exists-p
		   (setq path
			 (expand-file-name
			  org-file
			  dir)))
	      (throw 'result path))))
    (let ((default-directory (file-name-directory path)))
      (org-babel-load-file path))))

   (org-require 'org-ref)
   (require 'jmax-bibtex)
   (setq org-ref-bibliography-notes "~/Dropbox/Arbeit/Papers/notes/notes.org")
   (setq org-ref-default-bibliography '("~/Dropbox/Arbeit/Papers/bibliography.bib"))
   (setq org-ref-pdf-directory "~/Dropbox/Arbeit/Papers/pdf/")
   (setq reftex-default-bibliography '("~/Dropbox/Arbeit/Papers/bibliography.bib"))
   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
