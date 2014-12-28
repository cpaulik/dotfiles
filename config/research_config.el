
;;(require-package 'ebib)
;;(require 'ebib)
(load "parsebib.el")
(autoload 'helm-bibtex "helm-bibtex" "" t)
(setq helm-bibtex-bibliography "/home/cp/Dropbox/Arbeit/Papers/bibliography.bib")
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

(define-key global-map (kbd "C-c )") 'helm-bibtex)

(provide 'research_config)
