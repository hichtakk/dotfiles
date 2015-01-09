; inhibit startup screen
(setq inhibit-startup-screen t)

; delete auto-save files when quit
(setq delete-auto-save-files t)

; always insert a blank line at the end of buffer
(setq require-final-newline t)

; don't make new line at bottom
(setq next-line-add-newlines nil)

; don't ring error bell
(setq ring-bell-function 'ignore)

; use space with tab
(setq-default indent-tabs-mode nil)

; tab width
(setq-default tab-width 4)

; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

; scroll step
(setq scroll-step 1)

; highlight matching pair
(show-paren-mode t)
(setq show-paren-style 'expression)

; reload buffer automaticaly
(global-auto-revert-mode t)
