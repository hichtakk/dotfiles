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
