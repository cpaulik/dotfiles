;;; packages.el --- obsidian Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst obsidian-packages
  '(
    obsidian
    ))


(defvar obsidian-excluded-packages '()
  "List of packages to exclude.")

(defun obsidian/init-obsidian()
  (use-package obsidian
    :config
    (global-obsidian-mode t)
    (obsidian-backlinks-mode t)
    (spacemacs/set-leader-keys-for-major-mode 'markdown-mode
      "gg" 'obsidian-follow-link-at-point
      "gb" 'obsidian-backlink-jump
      "sp" 'obsidian-jump
      "st" 'obsidian-find-tag
      "ol" 'obsidian-insert-link
      "dl" 'obsidian-remove-link
      "ot" 'obsidian-insert-tag
      "oh" 'obsidian-hydra/body)
    (spacemacs/declare-prefix "o" "obsidian")
    (spacemacs/set-leader-keys
      "oo" 'obsidian-capture)
    :custom
    ;; location of obsidian vault
    (obsidian-directory "/Users/christoph/Documents/todos/")
    ;; Default location for new notes from `obsidian-capture'
    (obsidian-inbox-directory "Inbox")))

;; (defun my_python/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
