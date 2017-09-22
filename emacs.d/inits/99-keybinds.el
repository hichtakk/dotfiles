; key bindings

;; use C-h as backspace
; see https://www.emacswiki.org/emacs/BackspaceKey
(define-key key-translation-map [?\C-h] [?\C-?])

;; describe mode
(define-key global-map (kbd "M-?") 'describe-mode)

;;; helm
;
;; helm-find-file
;; see http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;(define-key helm-find-files-map (kbd "?") 'helm-select-action)
;(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;  "Execute command only if CANDIDATE exists"
;  (when (file-exists-p candidate)
;        ad-do-it))

;; etags
;(define-key global-map (kbd "C-c t") 'syohex/helm-etags-select)
(define-key global-map (kbd "C-c b") 'pop-tag-mark)
