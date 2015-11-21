;;; packages.el --- pdf-tools Layer packages File for Spacemacs
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
(setq pdf-tools-packages
    '(
      ;; package names go here
      pdf-tools
      ))

;; List of packages to exclude.
(setq pdf-tools-excluded-packages '())

;; For each package, define a function pdf-tools/init-<package-name>
;;
(defun pdf-tools/init-pdf-tools ()
  "Initialize my package"
  (use-package pdf-tools
    :defer t
    :commands pdf-view-mode
    :init
    (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
    :config
    (evilified-state-evilify-map pdf-view-mode-map
      :mode pdf-view-mode
      :bindings
      (kbd "j") 'pdf-view-next-line-or-next-page
      (kbd "k") 'pdf-view-previous-line-or-previous-page
      (kbd "J") 'pdf-view-next-page
      (kbd "K") 'pdf-view-previous-page)
    (setq pdf-view-continuous t)
    )
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
