; inhibit startup screen
(setq inhibit-startup-screen t)

; always insert a blank line at the end of buffer
;(setq require-final-newline t)

; don't make new line at bottom
(setq next-line-add-newlines nil)

; don't ring error bell
(setq ring-bell-function 'ignore)

; use space with tab
(setq-default indent-tabs-mode nil)

; tab width
(setq-default tab-width 4)

; yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; scroll step
(setq scroll-step 1)

; highlight matching pair
(show-paren-mode t)
(setq show-paren-style 'expression)

; reload buffer automaticaly
(global-auto-revert-mode t)

; backup and auto-save
; see http://dan-project.blog.so-net.ne.jp/2012-06-04

; see http://qiita.com/catatsuy/items/f9fad90fa1352a4d3161
;; create backup file in ~/.emacs.d/.backup
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/.backup"))
            backup-directory-alist))

;; delete auto-save files when quit
(setq delete-auto-save-files t)

;; create auto-save file in ~/.emacs.d/.backup
(setq auto-save-file-name-transforms
            `((".*" ,(expand-file-name "~/.emacs.d/.backup/") t)))

; window system
(when window-system
  ;; transparency
  (set-frame-parameter nil 'alpha 95)
  ;; disable menu bar
  (menu-bar-mode 0)
  ;; disable tool bar
  (tool-bar-mode 0)
  ;; disable scroll bar
  (toggle-scroll-bar 0)
  ;; font
  (when (eq system-type 'darwin)
    ;; Ricty
    (setq font-hight 120) ; 140, 160
    (set-face-attribute 'default nil
                        :family "Ricty Diminished"
                        :height font-hight)
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty Diminished")))
  )
