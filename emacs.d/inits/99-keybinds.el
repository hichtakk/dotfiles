; key bindings

;; use C-h as backspace
(keyboard-translate ?\C-h ?\C-?)

;; describe mode
(define-key global-map (kbd "M-?") 'describe-mode)

;; helm
(global-set-key (kbd "C-x ?") 'helm-descbinds)
(define-key global-map (kbd "M-i") 'helm-imenu)
(define-key global-map (kbd "M-r") 'helm-recentf)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)

;; etags
(define-key global-map (kbd "C-c t") 'syohex/helm-etags-select)
(define-key global-map (kbd "C-c b") 'pop-tag-mark)
