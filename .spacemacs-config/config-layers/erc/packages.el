;;; packages.el --- erc Layer packages File for Spacemacs
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

(defvar erc-packages
  '(
    ;; package ercs go here
    erc
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar erc-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function erc/init-<package-erc>
;;
(defun erc/init-erc ()
  "Initialize my package"
  (use-package erc
    :defer t
    :init
    (progn
    (defun erc-list-command ()
    "execute the list command"
    (interactive)
                 (insert "/list")
                 (erc-send-current-line))
      (evil-leader/set-key
        "ae" 'erc
        "oi" 'erc-iswitchb)
      (evil-leader/set-key-for-mode 'erc-mode
        "mb" 'erc-iswitchb
        "md" 'erc-input-action
        "mj" 'erc-join-channel
        "mn" 'erc-channel-names
        "mp" 'erc-part-from-channel
        "mq" 'erc-quit-server
        "ml" 'erc-list-command
        )
      (setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))
      (setq erc-kill-buffer-on-part t)
      (setq erc-kill-server-buffer-on-quit t)
      )
    )
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
