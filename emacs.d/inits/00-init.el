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

; key bindings
;; use C-h as backspace
(define-key global-map (kbd "C-h") 'delete-backward-char)

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
