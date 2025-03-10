;;; packages.el --- my_python Layer packages File for Spacemacs
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

(defconst my_python-packages
  '(
    ;; package my_pythons go here
    ;; py-autopep8
    flycheck-pyflakes
    python
    ))


(defvar my_python-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function my_python/init-<package-my_python>
;;
;; (defun my_python/init-py-autopep8()
;;   (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;;   )

(defun my_python/init-flycheck-pyflakes()
  (use-package flycheck-pyflakes)
  )

(defun my_python/post-init-python()

  (defun my_python/where-am-i ()
    (interactive)
    (message (python-info-current-defun)))

  (spacemacs/set-leader-keys-for-major-mode 'python-mode
    "hw" 'my_python/where-am-i)

  )

;; (defun my_python/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
