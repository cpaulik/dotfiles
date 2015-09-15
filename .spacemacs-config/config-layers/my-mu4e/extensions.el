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
(defvar my-mu4e-post-extensions
    '(
      ;; package names go here
      mu4e
      org-mu4e
      ))

;; For each package, define a function my-mu4e/init-<package-name>
;;
(defun my-mu4e/init-mu4e ()
   "Initialize my package"
   (use-package mu4e
     :defer t
     :commands mu4e
     :init
     (evil-leader/set-key "om" 'mu4e)
     :config
        (setq mu4e-view-show-images t)
        ;; use imagemagick if available
        (when (fboundp 'imagemagick-register-types)
        (imagemagick-register-types))
        (setq mu4e-html2text-command "html2text -utf8 -width 80")
        ;; default
        ;; sending mail -- replace USERNAME with your gmail username
        ;; also, make sure the gnutls command line utils are installed
        ;; package 'gnutls-bin' in Debian/Ubuntu

        (require 'smtpmail)
        (setq mu4e-maildir "~/Mail")
        ;; setup main account
        (setq mu4e-sent-folder "/Personal/[Gmail].Sent Mail"
              mu4e-drafts-folder "/Personal/[Gmail].Drafts"
              mu4e-trash-folder  "/Personal/[Gmail].Trash"
              user-mail-address "cpaulik@gmail.com"
              smtpmail-default-smtp-server "smtp.gmail.com"
              smtpmail-smtp-server "smtp.gmail.com"
              smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
              smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cpaulik@gmail.com" nil))
              smtpmail-smtp-service 587)
        ;; setup information for account switching
        (defvar my-mu4e-account-alist
          '(("Personal"
             (mu4e-sent-folder "/Personal/[Gmail].Sent Mail")
             (mu4e-drafts-folder "/Personal/[Gmail].Drafts")
             (mu4e-trash-folder  "/Personal/[Gmail].Trash")
             (user-mail-address "cpaulik@gmail.com")
             (user-full-name  "Christoph Paulik")
             (smtpmail-smtp-user "cpaulik@gmail.com")
             (smtpmail-smtp-server "smtp.gmail.com")
             (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
             (smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cpaulik@gmail.com" nil)))
             (smtpmail-smtp-service 587))
            ("TU"
             (mu4e-sent-folder "/TU/Sent Items")
             (mu4e-drafts-folder "/TU/Drafts")
             (mu4e-trash-folder  "/TU/Deleted Items")
             (user-mail-address "christoph.paulik@geo.tuwien.ac.at")
             (user-full-name  "Christoph Paulik")
             (smtpmail-smtp-user "cpaulik")
             (smtpmail-smtp-server "mail.intern.tuwien.ac.at")
             (smtpmail-starttls-credentials '(("mail.intern.tuwien.ac.at" 587 nil nil)))
             (smtpmail-auth-credentials '(("mail.intern.tuwien.ac.at" 587 "cpaulik" nil)))
             (smtpmail-smtp-service 587))))
        (defun my-mu4e-set-account ()
          "Set the account for composing a message."
          (let* ((account
                  (if mu4e-compose-parent-message
                      (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                        (string-match "/\\(.*?\\)/" maildir)
                        (match-string 1 maildir))
                    (completing-read (format "Compose with account: (%s) "
                                             (mapconcat #'(lambda (var) (car var))
                                                        my-mu4e-account-alist "/"))
                                     (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                     nil t nil nil (caar my-mu4e-account-alist))))
                 (account-vars (cdr (assoc account my-mu4e-account-alist))))
            (if account-vars
                (mapc #'(lambda (var)
                          (set (car var) (cadr var)))
                      account-vars)
              (error "No email account found"))))
        (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
        ;; save message to Sent Messages
        (setq mu4e-sent-messages-behavior 'sent)

        ;; setup some handy shortcuts
        ;; you can quickly switch to your Inbox -- press ``ji''
        ;; then, when you want archive some messages, move them to
        ;; the 'All Mail' folder by pressing ``ma''.

        (setq mu4e-maildir-shortcuts
            '( ("/Personal/INBOX"               . ?i)
            ("/Personal/[Gmail].Sent Mail"   . ?s)
            ("/Personal/[Gmail].Trash"       . ?t)
            ("/Personal/[Gmail].All Mail"    . ?a)
            ("/TU/INBOX"       . ?w)
            ))

        ;; allow for updating mail using 'U' in the main view:
        (setq mu4e-get-mail-command "offlineimap")

        ;; something about ourselves
        (setq mu4e-compose-signature ""
            mu4e-user-mail-address-list
            '("cpaulik@gmail.com"
            "christoph.paulik@geo.tuwien.ac.at"
            "Christoph.Paulik@geo.tuwien.ac.at")
            )


        ;; don't keep message buffers around
        (setq message-kill-buffer-on-exit t)
        (setq mu4e-use-fancy-chars t
                mu4e-headers-draft-mark     '("D" . "⚒ ")  ; draft
                mu4e-headers-seen-mark      '("S" . "☑ ")  ; seen
                mu4e-headers-unseen-mark    '("u" . "☐ ")  ; unseen
                mu4e-headers-flagged-mark   '("F" .  "⚵ ") ; flagged
                mu4e-headers-new-mark       '("N" .  "✉ ") ; new
                mu4e-headers-replied-mark   '("R" . "↵ ")  ; replied
                mu4e-headers-passed-mark    '("P" . "⇉ ")  ; passed
                mu4e-headers-encrypted-mark '("x" . "⚷ ")  ; encrypted
                mu4e-headers-signed-mark    '("s" . "✍ ")) ; signed

        ;;; message view action
        (defun mu4e-msgv-action-view-in-browser (msg)
            "View the body of the message in a web browser."
            (interactive)
            (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
                    (tmpfile (format "%s/%d.html" temporary-file-directory (random))))
                (unless html (error "No html part for this message"))
                (with-temp-file tmpfile
                (insert
                "<html>"
                "<head><meta http-equiv=\"content-type\""
                "content=\"text/html;charset=UTF-8\">"
                html))
                (browse-url (concat "file://" tmpfile))))

            (add-to-list 'mu4e-view-actions
                        '("View in browser" . mu4e-msgv-action-view-in-browser) t)
        (setq
        mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
        mu4e-update-interval 300)             ;; update every 5 minutes

        (add-hook 'mu4e-view-mode-hook 'visual-line-mode)

        ;; send mail from address that received it
        (add-hook 'mu4e-compose-pre-hook
                (defun my-set-from-address ()
                    "Set the From address based on the To address of the original."
                    (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
                    (if msg
                        (setq user-mail-address
                                (cond
                                ((mu4e-message-contact-field-matches msg :to "@gmail")
                                "cpaulik@gmail.com")
                                ((mu4e-message-contact-field-matches msg :to "Christoph.Paulik@geo.tuwien.ac.at")
                                "Christoph.Paulik@geo.tuwien.ac.at")
                                ((mu4e-message-contact-field-matches msg :to "christoph.paulik@geo.tuwien.ac.at")
                                 "Christoph.Paulik@geo.tuwien.ac.at")
                                ((mu4e-message-contact-field-matches msg :to "cpa@ipf.tuwien.ac.at")
                                "Christoph.Paulik@geo.tuwien.ac.at")
                                (t "cpaulik@gmail.com")))))))

        ;; not possible because message body is not available in headers view
        (add-to-list 'mu4e-header-info-custom
        '(:abstract .
            ( :name "first n characters of the message"  ;; long name, as seen in the message-view
            :shortname "Message"           ;; short name, as seen in the headers view
            :help "Number of recipients for this message" ;; tooltip
            :function
            (lambda (msg)
        (subseq (mu4e-message-field msg :body-txt) 0 5)
            ))))

        ;;remove list from headers view
        (setq mu4e-headers-fields (delete '(:mailing-list . 10) mu4e-headers-fields))
        ;;(add-to-list 'mu4e-headers-fields '(:abstract . 50))

        (setq mu4e-hide-index-messages t)

        ;; add new bookmarks
        (add-to-list 'mu4e-bookmarks
            '("flag:flagged" "Flagged/Starred messages" ?f))

        (defun org-mu4e-store-link ()
        "Store a link to a mu4e query or message."
        (cond
        ;; storing links to queries
        ((eq major-mode 'mu4e-headers-mode)
            (let* ((query (mu4e-last-query))
                desc link)
        (org-store-link-props :type "mu4e" :query query)
        (setq
            desc (concat "mu4e:query:" query)
            link desc)
        (org-add-link-props :link link :description desc)
        link))
            ;; storing links to messages
        ((eq major-mode 'mu4e-view-mode)
            (let* ((msg  (mu4e-message-at-point))
            (msgid   (or (plist-get msg :message-id) "<none>"))
            (from (car (car (mu4e-message-field msg :from))))
            (to (car (car (mu4e-message-field msg :to))))
            (subject (mu4e-message-field msg :subject))
            link)
            (setq link (concat "mu4e:msgid:" msgid))
            (org-store-link-props :type "mu4e" :link link
                    :message-id msgid)
            (setq link (concat "mu4e:msgid:" msgid))
            (org-store-link-props
            :type "mu4e" :from from :to to :subject subject
                    :message-id msgid)

            (org-add-link-props :link link
                    :description (funcall org-mu4e-link-desc-func msg))
            link))))

        (require 'org)
        (org-add-link-type "mu4e" 'org-mu4e-open)
        (add-hook 'org-store-link-functions 'org-mu4e-store-link)

        ;; spacemacs stuff
        (spacemacs|evilify-map mu4e-main-mode-map
          :mode mu4e-main-mode)
        (spacemacs|evilify-map mu4e-headers-mode-map
          :mode mu4e-headers-mode)
        (spacemacs|evilify-map mu4e-view-mode-map
          :mode mu4e-view-mode
          :bindings
                 (kbd "RET") 'browse-url-at-point
                 (kbd "G") 'mu4e-view-go-to-url
                 (kbd "C-j") 'mu4e-view-headers-next
                 (kbd "C-k") 'mu4e-view-headers-prev)

     )
   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
