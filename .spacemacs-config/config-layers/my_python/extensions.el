;;; extensions.el --- my_python Layer extensions File for Spacemacs
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

(defvar my_python-pre-extensions
  '(
    ;; pre extension my_pythons go here
    )
  "List of all extensions to load before the packages.")

(defvar my_python-post-extensions
  '(
    ;; post extension my_pythons go here
    python-compile
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function my_python/init-<extension-my_python>
;;
(defun my_python/init-python-compile ()
;;   "Initialize my extension"
  (add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "python %s" (file-name-nondirectory buffer-file-name)))))
)
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
