; key bindings

;; use C-h as backspace
;(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-h") 'delete-backward-char)

;; describe mode
(define-key global-map (kbd "M-?") 'describe-mode)

;; helm
(global-set-key (kbd "C-x ?") 'helm-descbinds)
(define-key global-map (kbd "M-i") 'helm-imenu)
(define-key global-map (kbd "M-r") 'helm-recentf)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)

; helm-find-file
; see http://d.hatena.ne.jp/a_bicky/20140104/1388822688
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "?") 'helm-select-action)
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
        ad-do-it))

;; etags
(define-key global-map (kbd "C-c t") 'syohex/helm-etags-select)
(define-key global-map (kbd "C-c b") 'pop-tag-mark)
