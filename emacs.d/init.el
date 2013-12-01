; ~/.emacs.d/init.el

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; key bindings
;; use C-h as backspace
(define-key global-map (kbd "C-h") 'delete-backward-char)

; color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-solarized-20130307.1350")
(load-theme 'solarized-dark t)
