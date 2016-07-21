;;; packages.el --- org-page layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Paul Schorfheide <pschorf2@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-page-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-page/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-page/pre-init-PACKAGE' and/or
;;   `org-page/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-page-packages
  '(org-page
    (blog-admin :location (recipe
                           :fetcher github
                           :repo "codefalling/blog-admin")))

  "The list of Lisp packages required by the org-page layer.
Each entry is either:
1. A symbol, which is interpreted as a package to be installed, or
2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.
    The following keys are accepted:
    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil
    - :location: Specify a custom installation location.
      The following values are legal:
      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.
      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'
      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun org-page/init-org-page ()
  (spacemacs/declare-prefix "ab" "blog")
  (use-package org-page
    :config (progn (setq op/repository-directory "~/workspace/personal/org-blog/content"
                         op/site-main-title "Splendid Abacus"
                         op/site-sub-title "About a man and his computer"
                         op/site-domain "http://splendidabacus.com"
                         op/theme-root-directory "~/workspace/personal/org-blog/themes"
                         op/theme 'org-page-theme-martin
                         op/personal-disqus-shortname "livingwithacomputer"
                         op/personal-github-link "http://github.com/cpaulik"
                         op/personal-google-analytics-id "UA-57519234-1")
                   (spacemacs/set-leader-keys
                     "abp" 'op/do-publication-and-preview-site
                     "abP" 'op/do-publication))))


(defun org-page/init-blog-admin ()
  (use-package blog-admin
    :init
    (progn
      (setq blog-admin-backend-type 'org-page)
      (setq blog-admin-backend-path "~/workspace/personal/org-blog/content")
      (setq blog-admin-backend-new-post-in-drafts t)
      (setq blog-admin-backend-new-post-with-same-name-dir t)
      (setq blog-admin-backend-org-page-drafts "_drafts") ;; directory to save draft
      (setq blog-admin-backend-org-page-config-file nil) ;; if nil init.el is used
      ))
  )
;;; packages.el ends here
