;;; packages.el --- notmuch Layer packages File for Spacemacs
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
(setq notmuch-packages
    '(
      ;; package names go here
      notmuch
      ))

;; List of packages to exclude.
(setq notmuch-excluded-packages '())

;; For each package, define a function notmuch/init-<package-name>
;;
(defun notmuch/init-notmuch ()
  "Initialize my package"
  (use-package notmuch
    :defer t
    :commands notmuch
    :init
    (evil-leader/set-key "om" 'notmuch)
    :config
    (evilify notmuch-hello-mode notmuch-hello-mode-map
             "J" 'notmuch-jump-search)
    (evilify notmuch-search-mode notmuch-search-mode-map
             "J" 'notmuch-jump-search
             "gg" 'notmuch-search-first-thread
             "G" 'notmuch-search-last-thread)
    (evilify notmuch-show-mode notmuch-show-mode-map
             "J" 'notmuch-jump-search)
    (setq notmuch-fcc-dirs '(("cpaulik@gmail.com" . nil)
                             ("christoph.paulik@geo.tuwien.ac.at" . "work-sent")))
    )
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
