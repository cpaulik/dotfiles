;;; packages.el --- twitter Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq twitter-packages
    '(
      twittering-mode
      ;; package names go here
      ))

;; List of packages to exclude.
(setq twitter-excluded-packages '())

;; For each package, define a function twitter/init-<package-name>
;;
(defun twitter/init-twittering-mode ()
  "Initialize my package"
  (use-package twittering-mode
    :defer t
    :config
    (setq twittering-icon-mode t)
    (setq twittering-use-master-password t)
    (evilified-state-evilify-map twittering-mode-map
      :mode twittering-mode
      :bindings
      (kbd "j") 'twittering-goto-next-status
      (kbd "k") 'twittering-goto-previous-status)
    )
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
