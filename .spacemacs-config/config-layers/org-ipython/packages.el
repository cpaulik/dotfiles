;;; packages.el --- org-ipython Layer packages File for Spacemacs
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
(setq org-ipython-packages
    '(
      ;; package names go here
      ob-ipython
      ))

;; List of packages to exclude.
(setq org-ipython-excluded-packages '())

;; For each package, define a function org-ipython/init-<package-name>
;;
(defun org-ipython/init-ob-ipython ()
  "Initialize my package"
  (spacemacs|use-package-add-hook org
    :pre-init
    ;; Code
    :post-init
    ;; Code
    :pre-config
    ;; Code
    :post-config
    ;; Code
    (use-package ob-ipython)
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
    )
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
