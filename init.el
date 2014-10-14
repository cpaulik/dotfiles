(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path "~/.emacs.d/config/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/config/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/config/org-reveal" t)
(add-to-list 'load-path "~/.emacs.d/config/evil-rebellion" t)
(require 'init-packages)

(require-package 'load-relative)
(require 'load-relative)
(require 'package)
(package-initialize)
(require 'indi_config)
(require 'org_config)

(require 'org_jekyll)
(setq org-agenda-files (quote ("~/Dropbox/org"
			       "~/Dropbox/Arbeit/organisation/pytesmo.org"
			       )))
(require 'mu4e_config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
