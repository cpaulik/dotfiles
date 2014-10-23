(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path "~/.emacs.d/config/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/config/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/config/org-reveal" t)
(add-to-list 'load-path "~/.emacs.d/config/evil-rebellion" t)
(require 'init-packages)

(require-package 'load-relative)
(require 'load-relative)
(require 'package)
(package-initialize)
(require 'indi_config)
(require 'org_config)

(require 'org_jekyll)
(setq org-agenda-files (quote ("~/Dropbox/org"
			       "~/Dropbox/Arbeit/organisation/pytesmo.org"
			       )))
(require 'mu4e_config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-safe-themes
   (quote
    ("b535c023e51a0f6cc9edbbcd7b4bf0b061bff94d1cf5bde4b906f9f64aaf47fa" "4b397601a35af2ce405b6fc9b4f093baabc2c5e9dc877f6971eb9fadcd3f15eb" "798c5c40b4daa1ef8579754caa4e00b7c2ba94356c9e28e5edfa5c335604590a" "1204b3c791290b8bb144427a9c91f2362482302a2020ae5f138cb27aa5e671df" "ca330eaaa6999f43a688dcc0534ae513de591168581e1d7538eb557d1045ceff" "8dc3a13daeb27ac5429ef55a8aba843aa50990426f42c738f512d320af0e6dae" "2798b0e7ed0a9a305ee63317f6c6a9260a6b515408a70eb54eab85131ad52136" "1bf0e30d7997c87c48ad663cbbc0b86c5dc814214aaa315503c90bdd32b0ced7" "490d652696a704b651f3d8e2c73490354f42787c55ed9f0b4c90a8de6198a5c0" "00ee51be7c1c7a22d3afa500a29d5d3293b325bb8641751400122ae688a4b8e3" "b543a00da48bd45a428f9c2002c72a0fe1f4d8199c04de0ff19f309482554320" "c82e5c30b62a420dac7bdc9113bc2f18765141b6d1436e0d0544c8f0b92c769f" "f55df94d13b087461e79871dad523929ae722f50e6c7c58ddbb36b20016f37fd" "00685a157d28c386eac31899a3626f8993626faa456a068cdeb917756aa0848e" "dbbaa36cd7314efc5b386a447e98d3102dfcb01d239018232c39119133280cf4" "5e8768687f1a32941a73e3b8268db03f729f6d6462265b148a2ae97ef82aabcf" "6dd964b6ab2cd08ebde2f56f59fb2ae6e6acdf471c9dc15773a9f90557be805b" "c7803a8c8f67d234e5be6cfebf8d7250cb1b7e947f30d53b466419a5980603c8" "4c56bb832ca0dc6c724edfd45b2a528e8b4520c0e1914afce938e4d501205839" "f10714ff77efed68a6461b8262105776f18104e5e64d5071f8389ddddb2c3d2f" "cbf4719153caaf315d4d8b829f7125903f88495c2eec97ca909058261d90101c" "551289be120eb2e8950d9f2308115f24947de7275c10dd31b8a0605a8e123e20" "e6aec0b8f7a07eb174a685b18d1d1d6f6b8aa3143218148a3e18982f501e76a8" "2af7a61320f6f40885ba01908b635a7d93af777bdee177b29754362bcbb4d3f7" "cc9b338e3cec405d8a68a00ddc6c22941e49927ede18ded49bbfeb278360eb0a" "497f69941f95e45616d3d20d5985863856710ad940dad4c7f923ba998778730c" "6b99e54b71ab913a645837772ca79fa322322c5026bc4443201ca9fded87a569" "c13a4bf96d62e61c9cbc6ac42ea8b19e731bc51f53542f6747a6359ed4c3e0ff" "7bed39925e8673ec3a02c1219a00904d171a7f8117d7634dfa166f320e003efa" "1d0760d3b45b34cdd43023a9ac7a79699c54991ed9c2141f7deb984a1745b210" "433fa745db71b5bc849862173ce517b3e9fd4100311eafbed97d887eba2ab33d" "98c65cff12b47fb1ba67e919d9e1c9c5b6adfa69abddfd49816ff4f146b10724" "73f5b15aba46f69afd4bc061c638fed4f3457d1bd3a173529fe9dde2b579defd" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(fci-rule-color "#37474f")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
