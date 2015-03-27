;;; packages.el --- gnus Layer packages File for Spacemacs
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

(defvar gnus-packages
  '(
    ;; package gnuss go here
    gnus
    w3m
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar gnus-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function gnus/init-<package-gnus>
;;
(defun gnus/init-w3m ()
  "setup w3m"
  (use-package w3m
    :init
    (progn
    (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
    )
  )
 ;; optional keyboard short-cut

 )
(defun gnus/init-gnus ()
  "Initialize my package"
  (use-package gnus
    :defer t
    :init
    :config
    (progn
    ;; No primary server:
    (setq gnus-select-method '(nnnil ""))
    ;; Get email, and store in nnml
    (setq gnus-secondary-select-methods '(
                                        (nnimap "gmail"
                                                (nnimap-address
                                                 "imap.gmail.com")
                                                (nnimap-server-port 993)
                                                (nnimap-stream ssl))
                                        (nntp "gmane"
                                                (nntp-address "news.gmane.org"))
                                        (nntp "news.eternal-september.org")
                                        (nntp "nntp.aioe.org")
                                        (nntp "news.gwene.org")
                                        ))
    ; Send email via Gmail:
    (setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")
; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "imap.gmail.com")
      gnus-message-archive-group "[Gmail]/Sent Mail")
(setq gnus-posting-styles
      '(((header "to" "cpaulik@gmail.com")
         (address "cpaulik@gmail.com"))
	((header "to" "christoph.paulik@geo.tuwien.ac.at")
         (address "christoph.paulik@geo.tuwien.ac.at"))))
    (setq nnml-directory "~/gmail")
    (setq message-directory "~/gmail")
    (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")
    ; Use fancy splitting:
    (setq nnmail-split-methods 'nnmail-split-fancy)
    (setq nnmail-split-fancy
        '(| ("To\\|Cc" "cpaulik@gmail\\.com" "gmail")
        ("To\\|Cc" "christoph\\.paulik@geo\\.tuwien\\.ac\\.at" "job")
        ;;; Add any mailing lists you want here, like this:
        ;; Catch all folder if nothing else matches.
        "spam"))
    ; Use topics per default:
    (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
    ; Show more MIME-stuff:
    (setq gnus-mime-display-multipart-related-as-mixed t)
    ; Smileys:
    (setq smiley-style 'medium)
    ; Don't get the first article automatically:
    (setq gnus-auto-select-first nil)

    (setq gnus-visible-headers
        "^From:\\|^Reply-To\\|^Organization:\\|^To:\\|^Cc:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Gnus")

    ;;; Show the article headers in this order.
    (setq gnus-sorted-header-list
        '("^From:" "^Reply-To" "^Organization:" "^To:" "^Cc:" "^Newsgroups:"
    "^Subject:" "^Date:" "^Gnus"))

    (setq-default
        gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f  %B (%c) %s%)\n"
        gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
        gnus-group-line-format "%M%S%p%P%5y:%B %G\n";;"%B%(%g%)"
        gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
        gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date)
        gnus-sum-thread-tree-false-root ""
        gnus-sum-thread-tree-indent " "
        gnus-sum-thread-tree-leaf-with-other "├► "
        gnus-sum-thread-tree-root ""
        gnus-sum-thread-tree-single-leaf "╰► "
        gnus-sum-thread-tree-vertical "│"
        gnus-article-browse-delete-temp t
        gnus-fetch-old-headers t
        gnus-treat-strip-trailing-blank-lines 'last
        gnus-keep-backlog 'nil
        gnus-keep-backlog '0)

    ; Don't show that annoying arrow:
    (setq gnus-summary-display-arrow nil)
    ;; (setq mm-text-html-renderer 'w3m-standalone)
    (evilify gnus-group-mode gnus-group-mode-map)
    (evilify gnus-server-mode gnus-server-mode-map)
    (evilify gnus-browse-mode gnus-browse-mode-map)
    (evilify gnus-article-mode gnus-article-mode-map)
    (evilify gnus-summary-mode gnus-summary-mode-map
      (kbd "J") 'gnus-summary-next-article
      (kbd "K") 'gnus-summary-prev-article
      (kbd "<RET>") 'browse-nnrss-url)

    (evil-leader/set-key "ag" 'gnus)

    (require 'browse-url)
    (require 'nnrss)

    (defun browse-nnrss-url (arg)
    (interactive "p")
    (let ((url (assq nnrss-url-field
                        (mail-header-extra
                        (gnus-data-header
                        (assq (gnus-summary-article-number)
                                gnus-newsgroup-data))))))
        (if url
            (progn
            (browse-url (cdr url))
            (gnus-summary-mark-as-read-forward 1))
        (gnus-summary-scroll-up arg))))


    (add-to-list 'nnmail-extra-headers nnrss-url-field)
    ;; setup org-mime
    (require 'org-mime)
    (add-hook 'message-mode-hook
            (lambda ()
                (local-set-key "\C-c\M-o" 'org-mime-htmlize)))

    (add-hook 'org-mode-hook
            (lambda ()
                (local-set-key "\C-c\M-o" 'org-mime-org-buffer-htmlize)))

    )
  )
)
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
