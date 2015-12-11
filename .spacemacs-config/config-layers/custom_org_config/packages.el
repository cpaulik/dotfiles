;;; packages.el --- custom_org_config Layer packages File for Spacemacs
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

(defvar custom_org_config-packages
  '(
    org
    org-ac
    ;; package custom_org_configs go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar custom_org_config-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function custom_org_config/init-<package-custom_org_config>
;;

(defun custom_org_config/init-org-ac()
  (use-package org-ac
    :defer t
    :config
    (progn
      (org-ac/config-default)
      )
    )

  )



(defun custom_org_config/post-init-org ()
;;   "Initialize my package"
;;load exporters for odt and texinfo - new in org 8
  (use-package org
    :defer t
    :commands (org-mode
               org-edit-src-exit
               org-agenda
               org-capture
               org-store-link
               org-iswitchb
               org-clock-goto
               org-clock-in)
    :init
    (progn
      (spacemacs/set-leader-keys "m'" 'org-edit-src-exit)

      ;; set org agenda global
      (spacemacs/set-leader-keys "oo" 'org-agenda)
      (spacemacs/set-leader-keys "oc" 'org-capture)

      ;; set punch in and out keys

      ;; Custom Key Bindings
      (global-set-key "\C-cl" 'org-store-link)
      (global-set-key "\C-ca" 'org-agenda)
      (global-set-key "\C-cb" 'org-iswitchb)
      (global-set-key (kbd "C-c c") 'org-capture)
      (global-set-key (kbd "<f12>") 'org-agenda)
      (global-set-key (kbd "<f11>") 'org-clock-goto)
      (global-set-key (kbd "C-<f11>") 'org-clock-in)
      )
    :config
    (progn
      ;; set org specific keybindings
      (add-hook 'org-agenda-mode-hook
                '(lambda () (org-defkey org-agenda-mode-map "R" 'org-agenda-refile))
                'append)
      (require 'org-pelican)
      (setq org-src-fontify-natively 1)
      (setq org-agenda-span 'day)
      (setq org-default-notes-file "~/Dropbox/org/refile.org")


      (setq org-directory "~/Dropbox/org")
      (setq org-agenda-files (quote ("~/Dropbox/org"
                                     "~/Dropbox/Arbeit/organisation"
                                     "~/Dropbox/Arbeit/organisation/projects")))

      (setq org-agenda-persistent-filter t)
      (require 'ox-odt)
      (require 'ox-texinfo)
      (require 'ox-beamer)
      (require 'ox-html)
      (require 'ox-md)
      (require 'ox-reveal)

      ;; any headline with level <= 2 is a target
      (setq org-refile-targets '((nil :maxlevel . 2)
                                      ; all top-level headlines in the
                                      ; current buffer are used (first) as a
                                      ; refile target
                                 (org-agenda-files :maxlevel . 2)))

      ;; provide refile targets as paths, including the file name
      ;; (without directory) as level 1 of the path
      (setq org-refile-use-outline-path 'file)
      (setq org-enforce-todo-dependencies t)

      ;; allow to create new nodes (must be confirmed by the user) as
      ;; refile targets
      (setq org-refile-allow-creating-parent-nodes 'confirm)

      ;; refile only within the current buffer
      (defun my/org-refile-within-current-buffer ()
        "Move the entry at point to another heading in the current buffer."
        (interactive)
        (let ((org-refile-targets '((nil :maxlevel . 5))))
          (org-refile)))
      ;; enable helm org refile into subsection of agenda file
      (setq org-outline-path-complete-in-steps nil)

      ;;(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
      (add-hook 'org-mode-hook 'org-indent-mode)
      (add-hook 'org-mode-hook 'auto-fill-mode)

      (require 'ox-latex)
      (setq org-latex-listings 'minted)
      ;; setup minted to have frame, small text and line numbers
      (setq org-latex-minted-options
                 '(("frame" "lines")
                   ("fontsize" "\\scriptsize")
                   ("linenos" "")))

      ;; setup of latex processing
      (setq org-latex-pdf-process
         (quote
          ("pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
           "bibtex %b"
           "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
           "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f")))
      (setq org-latex-table-caption-above nil)
      (setq org-html-table-caption-above nil)
      (add-to-list 'org-latex-classes
                   '("article"
                     "\\documentclass{article}
      \\usepackage{geometry}
      \\geometry{a4paper, textwidth=6.5in, textheight=10in,
                  marginparsep=7pt, marginparwidth=.6in}
      \\usepackage{tabulary}
      \\usepackage{minted}
      \\usepackage{natbib}"
           ("\\section{%s}" . "\\section*{%s}")
           ("\\subsection{%s}" . "\\subsection*{%s}")
           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
           ("\\paragraph{%s}" . "\\paragraph*{%s}")
           ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((python . t)
         (ditaa . t)
         (R . t)
         (dot .t)
         (shell .t))
       )

      (setq org-confirm-babel-evaluate nil)
      (setq org-todo-keywords
            (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                    (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

      (setq org-use-fast-todo-selection t)
      ;; if state is changed using shift then no dates or notes are recorded
      (setq org-treat-S-cursor-todo-selection-as-state-change nil)
      ;; set tags according to state of the task

      (setq org-agenda-diary-file "~/Dropbox/org/diary.org")


      ;; Diary
      (require 'holidays)
      (setq holiday-austria-holidays '((holiday-fixed  1  1 "Neujahr")
                                       (holiday-fixed  1  6 "Heilige Drei Könige")
                                       (holiday-easter-etc 1 "Ostermontag")
                                       (holiday-fixed  5  1 "Staatsfeiertag")
                                       (holiday-easter-etc 39 "Christi Himmelfahrt")
                                       (holiday-easter-etc 50 "Pfingstmontag")
                                       (holiday-easter-etc 60 "Fronleichnam")
                                       (holiday-fixed  8 15 "Mariä Himmelfahrt")
                                       (holiday-fixed 10 26 "Nationalfeiertag")
                                       (holiday-fixed 11  1 "Allerheiligen")
                                       (holiday-fixed 12  8 "Maria Empfängnis")
                                       (holiday-fixed 12 25 "Erster Weihnachtstag")
                                       (holiday-fixed 12 26 "Zweiter Weihnachtstag")))
      (setq holiday-local-holidays holiday-austria-holidays)
      (setq calendar-holidays (append holiday-local-holidays holiday-other-holidays))

      (setq org-todo-state-tags-triggers
            (quote (("CANCELLED" ("CANCELLED" . t))
                    ("WAITING" ("WAITING" . t))
                    ("HOLD" ("WAITING") ("HOLD" . t))
                    (done ("WAITING") ("HOLD"))
                    ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                    ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                    ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

      ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
      (setq org-capture-templates
            (quote (("t" "todo" entry (file "~/Dropbox/org/refile.org")
                     "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                    ("r" "respond" entry (file "~/Dropbox/org/refile.org")
                     "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                    ("n" "note" entry (file "~/Dropbox/org/refile.org")
                     "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                    ("j" "Journal" entry (file+datetree "~/Dropbox/org/diary.org")
                     "* %?\n%U\n" :clock-in t :clock-resume t)
                    ("w" "org-protocol" entry (file "~/Dropbox/org/refile.org")
                     "* TODO Review %c\n%U\n" :immediate-finish t)
                    ("m" "Meeting" entry (file "~/Dropbox/org/refile.org")
                     "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                    ("p" "Phone call" entry (file "~/Dropbox/org/refile.org")
                     "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                    ("h" "Habit" entry (file "~/Dropbox/org/refile.org")
                     "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

      ;; Do not dim blocked tasks
      (setq org-agenda-dim-blocked-tasks nil)

      ;; Compact the block agenda view
      (setq org-agenda-compact-blocks t)

      ; Enable habit tracking (and a bunch of other modules)
      (setq org-modules (quote (org-bbdb
                                org-bibtex
                                org-crypt
                                org-gnus
                                org-id
                                org-info
                                org-jsinfo
                                org-license
                                org-habit
                                org-inlinetask
                                org-irc
                                org-mew
                                org-mhe
                                org-protocol
                                org-rmail
                                org-vm
                                org-wl
                                org-w3m)))

      (setq org-show-entry-below (quote ((default))))

      ;; Limit restriction lock highlighting to the headline only
      (setq org-agenda-restriction-lock-highlight-subtree nil)

      ;; Keep tasks with dates on the global todo lists
      (setq org-agenda-todo-ignore-with-date nil)

      ;; Keep tasks with deadlines on the global todo lists
      (setq org-agenda-todo-ignore-deadlines nil)

      ;; Keep tasks with scheduled dates on the global todo lists
      (setq org-agenda-todo-ignore-scheduled nil)

      ;; Keep tasks with timestamps on the global todo lists
      (setq org-agenda-todo-ignore-timestamp nil)

      ;; Remove completed deadline tasks from the agenda view
      (setq org-agenda-skip-deadline-if-done t)

      ;; Remove completed scheduled tasks from the agenda view
      (setq org-agenda-skip-scheduled-if-done t)

      ;; Remove completed items from search results
      (setq org-agenda-skip-timestamp-if-done t)

      (setq org-archive-mark-done nil)
      (setq org-archive-location "%s_archive::* Archived Tasks")

      ;; Include agenda archive files when searching for things
      (setq org-agenda-text-search-extra-files (quote (agenda-archives)))

      ;; Show all future entries for repeating tasks
      (setq org-agenda-repeating-timestamp-show-all t)

      ;; Show all agenda dates - even if they are empty
      (setq org-agenda-show-all-dates t)

      ;; Sorting order for tasks on the agenda
      (setq org-agenda-sorting-strategy
            (quote ((agenda habit-down time-up user-defined-up effort-up category-keep)
                    (todo category-up effort-up)
                    (tags category-up effort-up)
                    (search category-up))))

      ;; Start the weekly agenda on Monday
      (setq org-agenda-start-on-weekday 1)

      ;; Enable display of the time grid so we can see the marker for the current time
      (setq org-agenda-time-grid (quote ((daily today remove-match)
                                         #("----------------" 0 16 (org-heading t))
                                         (0900 1100 1300 1500 1700))))

      ;; Display tags farther right
      (setq org-agenda-tags-column -102)

      ;; Use sticky agenda's so they persist
      (setq org-agenda-sticky t)

      ;; clocking in

      ;; Resume clocking task when emacs is restarted
      (org-clock-persistence-insinuate)
      ;;
      ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
      (setq org-clock-history-length 23)
      ;; Resume clocking task on clock-in if the clock is open
      (setq org-clock-in-resume t)
      ;; Separate drawers for clocking and logs
      (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
      ;; Save clock data and state changes and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t)
      ;; Clock out when moving task to a done state
      (setq org-clock-out-when-done t)
      ;; Save the running clock and all clock history when exiting Emacs, load it on startup
      (setq org-clock-persist t)
      ;; Do not prompt to resume an active clock
      (setq org-clock-persist-query-resume nil)
      ;; Enable auto clock resolution for finding open clocks
      (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
      ;; Include current clocking task in clock reports
      (setq org-clock-report-include-clocking-task t)

      (setq org-time-stamp-rounding-minutes (quote (1 1)))

      (setq org-agenda-clock-consistency-checks
            (quote (:max-duration "4:00"
                    :min-duration 0
                    :max-gap 0
                    :gap-ok-around ("4:00"))))

      ;; Agenda clock report parameters
      (setq org-agenda-clockreport-parameter-plist
            (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
    )
  )



)
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
