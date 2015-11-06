;;; packages.el --- my-mu4e Layer packages File for Spacemacs
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
(defvar my-mu4e-packages
  '(
    ;; package names go here
    helm-mu
    mu4e-maildirs-extension
    ))

;; For each package, define a function my-mu4e/init-<package-name>
;;
(defun my-mu4e/init-helm-mu ()
  (use-package helm-mu
    :defer t
    :commands helm-mu
    :init (evil-leader/set-key "oM" 'helm-mu))
  )

(defun my-mu4e/init-mu4e-maildirs-extension ()
  (use-package mu4e-maildirs-extension
    :defer t))
