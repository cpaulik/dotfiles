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
   "Initialize my extension"
   ;; set compile command to buffer-file-name
   ;; if buffer-file-name exists
   ;; otherwise error occurs on e.g. org export including python src
   (add-hook 'python-mode-hook
           (lambda ()
             (set (make-local-variable 'compile-command)
                  (if buffer-file-name
                      (format "python %s" (file-name-nondirectory buffer-file-name))))))

    (defadvice compile (before ad-compile-smart activate)
    "Advises `compile' so it sets the argument COMINT to t
    if breakpoints are present in `python-mode' files"
    (when (derived-mode-p major-mode 'python-mode)
        (save-excursion
        (save-match-data
            (goto-char (point-min))
                ;; set COMINT argument to `t'.
                (ad-set-arg 1 t)))))
)
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
