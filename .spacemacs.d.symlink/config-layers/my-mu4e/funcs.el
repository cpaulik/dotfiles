;; function to return first name of email recipients
;; used by yasnippet
;; inspired by
;;http://blog.binchen.org/posts/how-to-use-yasnippets-to-produce-email-templates-in-emacs.html
(defun bjm/mu4e-get-names-for-yasnippet ()
  "Return comma separated string of names for an email"
  (interactive)
  (let ((email-name "") str email-string email-list email-name2 tmpname)
    (save-excursion
      (goto-char (point-min))
      ;; first line in email could be some hidden line containing NO to field
      (setq str (buffer-substring-no-properties (point-min) (point-max))))
    ;; take name from TO field - match series of names
    (when (string-match "^To: \"?\\(.+\\)" str)
      (setq email-string (match-string 1 str)))
    ;;split to list by comma
    (setq email-list (split-string email-string " *, *"))
    ;;loop over emails
    (dolist (tmpstr email-list)
      ;;get first word of email string
      (setq tmpname (car (split-string tmpstr " ")))
      ;;remove whitespace or ""
      (setq tmpname (replace-regexp-in-string "[ \"]" "" tmpname))
      ;;join to string
      (setq email-name
            (concat email-name ", " tmpname)))
    ;;remove initial comma
    (setq email-name (replace-regexp-in-string "^, " "" email-name))

    ;;see if we want to use the name in the FROM field
    ;;get name in FROM field if available, but only if there is only
    ;;one name in TO field
    (if (< (length email-list) 2)
        (when (string-match "^\\([^ ,\n]+\\).+writes:$" str)
          (progn (setq email-name2 (match-string 1 str))
                 ;;prefer name in FROM field if TO field has "@"
                 (when (string-match "@" email-name)
                   (setq email-name email-name2))
                 )))
    email-name))

(defun my-mu4e/get-sync-channels (location)
  (let ((sync-channels '((home . "gmail")
                         (work . "gmail-vandersat gmail"))))
    (cdr (assoc location sync-channels))))

(defun my-mu4e/refresh-home-only ()
  (interactive)
  (let ((mu4e-get-mail-command (concat "mbsync " (my-mu4e/get-sync-channels 'home))))
    (mu4e-update-mail-and-index nil)))

(defun my-mu4e/refresh-work-only ()
  (interactive)
  (let ((mu4e-get-mail-command "mbsync gmail"))
    (mu4e-update-mail-and-index nil)))
