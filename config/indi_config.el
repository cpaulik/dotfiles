(require 'cl-lib)

;; enable semantic parsing of files
(semantic-mode 1)

(require-package 'color-theme-solarized)
(require-package 'color-theme-wombat)
(require 'material-theme)
;;(require 'color-theme-zenburn)

;;(load-theme 'dichromacy)
;;(color-theme-zenburn)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 10"))
(set-face-attribute 'default t :font "DejaVu Sans Mono 10")

(define-key key-translation-map [dead-circumflex] "^")
(define-key key-translation-map [dead-acute] "´")
(define-key key-translation-map [S-dead-grave] "`")

(require-package 'ecb)
(require 'ecb)

;; convenient window configuration switching with C-c <left> and C-c <right>
(winner-mode 1)


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
(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-rebellion)

(define-key evil-normal-state-map (kbd "<C-j>")  'windmove-down)
(define-key evil-normal-state-map (kbd "<C-k>")  'windmove-up)
(define-key evil-normal-state-map (kbd "<C-h>")  'windmove-left)
(define-key evil-normal-state-map (kbd "<C-l>")  'windmove-right)

(require-package 'ace-jump-mode)
(require 'ace-jump-mode)
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode)
(define-key evil-motion-state-map (kbd "C-SPC") #'evil-ace-jump-word-mode)

(require-package 'powerline)
(require 'powerline)
(setq powerline-color1 "#657b83")
(setq powerline-color2 "#839496")
(powerline-default-theme)

(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#8ec200"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
		    :background "#83a9ce"
		    :foreground "#666666"
                    :box nil)

;; install smart parens
(require-package 'smartparens)
(require 'smartparens)
(smartparens-global-mode t)

(global-auto-revert-mode)

;; enable auto-complete mode
(require-package 'auto-complete)
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(add-to-list 'ac-modes 'org-mode)

;; markdown mode
(require-package 'markdown-mode)
(require 'markdown-mode)

;; yaml mode
(require-package 'yaml-mode)
(require 'yaml-mode)

(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-trigger-in-field t)

;; setup maximum column width
; deactivated since it is the cause for skipping lines on up key
; in emacs 24.3
(require-package 'fill-column-indicator)
; (require 'fill-column-indicator)
; (define-globalized-minor-mode
;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
; (global-fci-mode 0)


;;disable tool-bar and menu
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; set smooth scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 3)

;; setup visual line mode
(global-visual-line-mode)

;;set cursor colors manually
;;(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("grey" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("white" hollow))
(setq evil-operator-state-cursor '("white" hollow))

;; shows colors in the color they represent
(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

;;(my-global-rainbow-mode 1)
;; setup dirtree
(require-package 'dirtree)
(require 'dirtree)

(require-package 'virtualenvwrapper)
(require 'virtualenvwrapper)
;;setup python mode
(require-package 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;(setq
;; python-shell-interpreter "ipython"
;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; python-shell-completion-setup-code
;;   "from IPython.core.completerlib import module_completion"
;; python-shell-completion-module-string-code
;;   "';'.join(module_completion('''%s'''))\n"
;; python-shell-completion-string-code
;;   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(require-package 'pytest)
(require 'pytest)

;; custom function to run pytest on current file
(defun py-test-current ()
  (interactive)
  (compile (concat "py.test " (buffer-file-name)))
)
;; bind to C-c t
(add-hook 'python-mode-hook
	  (lambda () (local-set-key (kbd "C-c t") 'py-test-current)))



(require-package 'py-autopep8)
(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

;; Set paths for python projects and virtual environments
(require 'python_projects)
; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))
;;setup jedi
(require-package 'python-environment)
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; setup virtualenvwrapper
(require-package 'virtualenvwrapper)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)

;; Make C-c C-c behave like C-u C-c C-c in Python mode which allows for code in __main__ block
;(define-key python-mode-map (kbd "C-c C-c")
;  (lambda () (interactive) (python-shell-send-buffer t)))

;; setup flycheck
(require-package 'flycheck)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; flycheck-tip, show error messages as popup
(require-package 'flycheck-tip)
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)
(require-package 'flycheck-pyflakes)
(require 'flycheck-pyflakes)

(defun turn-on-flyspell ()
  "Force flyspell mode on using a positive argument. for use in hooks"
  (interactive)
  (flyspell-mode 1))
(autoload 'flyspell-mode "flyspell" "On the fly spell checker" t)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(call-interactively 'ac-flyspell-workaround)
(load-library "ispell")
(add-to-list 'ispell-local-dictionary-alist
                '("deutsch8"
                   "[a-zA-ZäöüßÄÖÜ]" "[^a-zA-ZäöüßÄÖÜ]" "[']" t
                  ("-C" "-d" "de_DE-neu.multi")
                  "~latin1" iso-8859-1))

;;switch dictionaries between German and English with F8 key
(defun fd-switch-dictionary()
      (interactive)
      (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "deutsch8") "english" "deutsch8")))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)
        ))

(global-set-key (kbd "<f8>")   'fd-switch-dictionary)
;; sr-speedbar
(require-package 'sr-speedbar)
(require 'sr-speedbar)

;;setup autoindent when pressing return
(define-key global-map (kbd "RET") 'newline-and-indent)
(require 'cl)				; common lisp goodies, loop

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

;;setup ido
;(require 'ido)
;(ido-mode t)

;; copy/paste with C-c and C-v and C-x, check out C-RET too
;; interferes with evil-visual-block
;;(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)


;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;highlight matching parenthesis
(require 'paren)
(show-paren-mode t)

; highlight the current line
(global-hl-line-mode t)
;;(custom-set-faces
;; '(highlight ((t (:bold nil)))))

; don't blink the cursor
(blink-cursor-mode 0)

;;setup latex
(require-package 'auctex)
(require-package 'cdlatex)
;(require 'auctex)
(require 'cdlatex)

;; Git integration through magit
(require-package 'magit)
(require 'magit)

(require-package 'web-mode)
(require 'web-mode)

;; package to save and restore window groups
(require-package 'workgroups2)
(require 'workgroups2)
;;(workgroups-mode 1)

;; expand region
(require-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)


;; helm package
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm              ;;
;;                            ;;
;; GROUP: Convenience -> Helm ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require-package 'helm)

(require 'helm)

;; must set before helm-config,  otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")

(require-package 'helm-projectile)
(require 'helm-projectile)
;; custom function for finding and switching projects
(defun cp/projectile-find ()
  "if not in a project switch to project"
  (interactive)
(if (projectile-project-p)
    (helm-projectile)
    (helm-projectile-switch-project)))
(global-set-key (kbd "C-x f") 'cp/projectile-find)

(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                     '(picture-mode artist-mode))
 helm-candidate-number-limit 200 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
 )

;; Save current position to mark ring when jumping to a different place
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)


(helm-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))

(global-linum-mode 0)			; add line numbers on the left
(add-hook 'prog-mode-hook 'linum-mode)

;; bind umlaut keys to brackets in prog mode
(add-hook 'prog-mode-hook
	  (lambda ()
	    (define-key prog-mode-map "ö" "[" )
	    (define-key prog-mode-map "ä" "]" )
	    (define-key prog-mode-map "Ä" "}" )
	    (define-key prog-mode-map "Ö" "{" )
	    ))

;; disable yasnippets in term mode
(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))
(add-hook 'term-mode-hook 'evil-emacs-state)
(provide 'indi_config)
