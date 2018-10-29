;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/config-layers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(typescript
     sql
     ansible
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
      auto-completion-enable-help-tooltip nil)
     bibtex
     c-c++
     clojure
     colors
     custom_org_config
     django
     docker
     (elfeed
      :variables rmh-elfeed-org-files (list "~/Dropbox/org/feeds.org"))
     emacs-lisp
     emoji
     erc
     finance
     games
     (git
      :variables
      git-gutter-use-fringe t)
     github
     gnus
     graphviz
     (gtags
      :variables gtags-enable-by-default)
     html
     ipython-notebook
     javascript
     (latex
      :variables latex-view-with-pdf-tools t)
     lua
     markdown
     my-mu4e
     my_python
     (org
      :variables org-enable-reveal-js-support t)
     org-ipython
     org-page
     pandoc
     pdf-tools
     plantuml
     php
     (python
      :variables
      python-enable-yapf-format-on-save nil
      python-auto-set-local-pyenv-version 'on-project-switch
      python-test-runner 'pytest)
     ranger
     research-config
     restclient
     ruby
     rust
     search-engine
     (semantic :disabled-for emacs-lisp)
     (shell
      :variables
      shell-default-shell 'term
      shell-default-term-shell "/bin/zsh")
     shell-scripts
     (spell-checking
      :variables spell-checking-enable-by-default nil)
     syntax-checking
     systemd
     tmux
     vagrant
     (version-control
      :variables version-control-diff-tool 'diff-hl)
     windows-scripts
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    material-theme
                                    evil-escape
                                    evil-terminal-cursor-changer
                                    sublime-themes
                                    magithub
                                    )
   ;; Defines the behaviour of Spacemacs when downloading packages.
   ;; Possible values are `used', `used-but-keep-unused' and `all'. `used' will
   ;; download only explicitly used packages and remove any unused packages as
   ;; well as their dependencies. `used-but-keep-unused' will download only the
   ;; used packages but won't delete them if they become unused. `all' will
   ;; download all the packages regardless if they are used or not and packages
   ;; won't be deleted by Spacemacs. (default is `used')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '((material :location "~/.spacemacs.d/material-theme")
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."


    (defun dotfiles/machine-location ()
      "Get the machine location.
Either returns home or work at the moment"
      (let ((machines '(("cpaulik-laptop" . work) ("cp-laptop" . home))))
        (cdr (assoc system-name machines))))

    (setq dotspacemacs-default-font '("Hack"
                                      :size 13
                                      :weight normal
                                      :width normal
                                      :powerline-scale 1.1))
    (when (eq (dotfiles/machine-location) 'work)
    ;; work machine
      (setq shell-file-name "/usr/bin/zsh")
      (setenv "SHELL" "/usr/bin/zsh")
      (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e" t)
      (setq dotspacemacs-default-font '("Hack"
                                        :size 13
                                        :weight normal
                                        :width normal
                                        :powerline-scale 1.3)

            browse-url-generic-program "chromium"
            org-odt-data-dir "/usr/share/emacs/25.3/etc/org"))

    (when (eq (dotfiles/machine-location) 'home)
    ;; home laptop with hdpi screen
    (setq dotspacemacs-default-font '("Hack"
                                      :size 24
                                      :weight normal
                                      :width normal
                                      :powerline-scale 1.6)
          browse-url-generic-program "chromium"
          exec-path-from-shell-arguments (list "-i")
          org-odt-data-dir "/usr/share/emacs/25.1/etc/org"))


    (add-to-list 'load-path "~/.spacemacs.d" t)

    ;; make sure customize stuff is written into different file
    (setq custom-file "~/.spacemacs.d/custom.el")
    (load custom-file))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."



  (when (eq (dotfiles/machine-location) 'work)
    ;; work machine
    (setq user-full-name "Christoph Paulik"
          user-mail-address "christoph.paulik@geo.tuwien.ac.at")
    (setenv "NO_PROXY" "dvlp1.geo.tuwien.ac.at,localhost,127.0.0.1")
    (setenv "no_proxy" "dvlp1.geo.tuwien.ac.at,localhost,127.0.0.1")
    )
  (when (eq (dotfiles/machine-location) 'home)
    ;; home laptop
    (setq user-full-name "Christoph Paulik"
          user-mail-address "cpaulik@gmail.com")

    (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

  (use-package erc
    :defer t
    :commands connect-erc
    :init (spacemacs/set-leader-keys "oe" 'connect-erc)
    :config
    (progn
      (setq erc-autojoin-channels-alist
            '(("0.0" "#syl20bnr/spacemacs")))
      (defun connect-erc ()
        (interactive)
        (erc-tls :server "irc.gitter.im" :nick "cpaulik" :password nil))))


  (spacemacs|define-custom-layout "@Start"
    :binding "s"
    :body
    (progn
      (org-agenda nil "A")
      (delete-other-windows)
      (split-window-right)
      (mu4e)))

  (defun endless/fill-or-unfill ()
    "Like `fill-paragraph', but unfill if used twice."
    (interactive)
    (let ((fill-column
           (if (eq last-command 'endless/fill-or-unfill)
               (progn (setq this-command nil)
                      (point-max))
             fill-column)))
      (call-interactively #'fill-paragraph)))

  (global-set-key [remap fill-paragraph]
                  #'endless/fill-or-unfill)

  (setq sp-highlight-pair-overlay nil
        sp-escape-quotes-after-insert nil
        sp-escape-wrapped-region nil)

  (setq powerline-default-separator 'arrow)


  ;; disable all the space-doc stuff
  (setq spacemacs-space-doc-modificators nil)

  (setq evil-move-beyond-eol t)
  (setq helm-window-prefer-horizontal-split t)

  ;; enable fundamental-mode snippets for all modes
  (add-hook 'yas-minor-mode-hook
            (lambda ()
              (yas-activate-extra-mode 'fundamental-mode)))

  ;; fancy git icon
  (defadvice vc-mode-line (after strip-backend () activate)
    (when (stringp vc-mode)
      (let ((gitlogo (replace-regexp-in-string "^ Git." " Ⱶ " vc-mode)))
        (setq vc-mode gitlogo))))
    (setq dired-listing-switches "-alhk")
    (setq dired-listings-switches "-alhk")
    (setq delete-by-moving-to-trash nil)
    (setq wdired-allow-to-change-permissions t)
    (setq compilation-finish-function nil)
    ;; Make evil-mode up/down operate in screen lines instead of logical lines
    (define-key evil-normal-state-map "j" 'evil-next-visual-line)
    (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
    ;; Also in visual mode
    (define-key evil-visual-state-map "j" 'evil-next-visual-line)
    (define-key evil-visual-state-map "k" 'evil-previous-visual-line)
    (setq doc-view-resolution 300)
    (setq vc-follow-symlinks t)
    ;; set default browser
    (setq browse-url-browser-function 'browse-url-generic)
    ;; set javascript company backends
    (setq company-backends-js2-mode '((company-tern :with company-dabbrev-code :with company-yasnippet)))
    ;; set python company backends
    (setq company-backends-python-mode '((company-anaconda :with company-dabbrev-code :with company-yasnippet)))
    (setq company-transformers '(spacemacs//company-transformer-cancel
                                 company-sort-by-backend-importance)))
