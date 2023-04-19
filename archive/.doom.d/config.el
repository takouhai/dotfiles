;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Daniel Alejandro Gallegos"
      user-mail-address "daniel@tacowolf.net")

(setq-default indent-tabs-mode nil)

(setq doom-font (font-spec :family "JetBrains Mono" :size 16))
(setq doom-themes-treemacs-enable-variable-pitch nil)
(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono") ; inherits `doom-font''s :size
      doom-big-font (font-spec :family "JetBrains Mono" :size 19)
      doom-unicode-font (font-spec :family "JetBrains Mono" :size 16)
      doom-serif-font (font-spec :family "JetBrains Mono" :size 16))

(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(global-whitespace-mode +1)

(with-eval-after-load 'doom-themes
  (doom-themes-neotree-config))
