(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'init-packages)


(require 'package)
(package-initialize)
(require 'load-relative)
(require 'cl-lib)
(define-key key-translation-map [dead-circumflex] "^")
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-numbers)
(require-package 'evil-visualstar)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit)
(require-package 'evil-exchange)
(require-package 'evil-surround)
;; activate evil mode
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(require 'evil)
(evil-mode 1)
(setq evil-default-cursor t)

;; enable auto-complete mode
(require-package 'auto-complete)
(require 'auto-complete)
(global-auto-complete-mode t)

(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;; setup maximum column width
; deactivated since it is the cause for skipping lines on up key
; in emacs 24.3
(require-package 'fill-column-indicator)
; (require 'fill-column-indicator)
; (define-globalized-minor-mode
;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
; (global-fci-mode 0)

(require-package 'color-theme-solarized)
(require-package 'color-theme-wombat)
(load-theme 'solarized-dark t)

;;disable tool-bar and menu
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; set smooth scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 3)

;;set cursor colors manually
;;(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("grey" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("white" hollow))
(setq evil-operator-state-cursor '("white" hollow))


;;setup jedi
(require-package 'python-environment)
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; Make C-c C-c behave like C-u C-c C-c in Python mode which allows for code in __main__ block
;(define-key 'python-mode-map (kbd "C-c C-c")
;  (lambda () (interactive) (python-shell-send-buffer t)))

;setup flymake to check python syntax
(require-package 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)


;;setup autoindent when pressing return
(define-key global-map (kbd "RET") 'newline-and-indent)
(require 'cl)				; common lisp goodies, loop

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(global-linum-mode 1)			; add line numbers on the left

;; setup standard org notes file
(setq org-default-notes-file "~/organisation/notes.org")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;setup ido
(require 'ido)
(ido-mode t)

;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;;setup python mode
(require 'python)
(setq
 python-shell-interpreter "ipython"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

;; set pytesmo development environment
(defun pytesmo_env ()
  (interactive)
  (setenv "PYTHONPATH" "/home/cp/workspace/pytesmo")
)

(if window-system (set-python-path-from-shell-PYTHONPATH))

;;highlight matching parenthesis
(require 'paren)
(show-paren-mode t)

; highlight the current line
(global-hl-line-mode t)

; don't blink the cursor
(blink-cursor-mode 0)

;;setup latex
;(require-package 'auctex)
(require-package 'cdlatex)
;(require 'auctex)
(require 'cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(org-agenda-files (quote ("~/Dropbox/Arbeit/science/2014/Correlation_Uncertainty.org" "~/workspace/IGARSS.org" "~/organisation/notes.org" "~/organisation/work_tasks.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
