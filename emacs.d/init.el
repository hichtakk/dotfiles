; ~/.emacs.d/init.el

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; key bindings
;; use C-h as backspace
(define-key global-map (kbd "C-h") 'delete-backward-char)
;; helm-recentf
(define-key global-map (kbd "M-r") 'helm-recentf)

; color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-solarized-20130307.1350")
(load-theme 'solarized-dark t)

;; don't show *scratch* message
(setq initial-scratch-message "*scratch*")

; delete auto-save files when quit
(setq delete-auto-save-files t)

;;; Always insert a blank line at the end of buffer
(setq require-final-newline t)

;;; Don't make new line at bottom
(setq next-line-add-newlines nil)

;;; Don't ring error bell
(setq ring-bell-function 'ignore)

; use space with tab
(setq-default indent-tabs-mode nil)

; tab width
(setq-default tab-width 4)

; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

; scroll step
(setq scroll-step 1)

; pop-win
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

; direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

;;; Mode line customize
;; display line number in modeline
(line-number-mode t)
;; display column number in modeline
(column-number-mode t)
;; display current directory
(show-paren-mode t)
(setq show-paren-style 'expression)
;; show current function name in modeline
(which-function-mode t)
;; display file size
(size-indication-mode t)

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
