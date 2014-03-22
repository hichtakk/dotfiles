; ~/.emacs.d/init.el

; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

; Window system
(when window-system
  ;; transparency
  (set-frame-parameter nil 'alpha 85)
  ;; disable menu bar
  (menu-bar-mode 0)
  ;; disable tool bar
  (tool-bar-mode 0)
  ;; disable scroll bar
  (toggle-scroll-bar nil)
  ;; font
  (when (eq system-type 'darwin)
    ;; Ricty
    (setq font-hight 140) ; 140, 160
    (set-face-attribute 'default nil
                        :family "Ricty"
                        :height font-hight)
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty")))
  )

; color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-solarized-20130307.1350")
(load-theme 'solarized-dark t)

; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
