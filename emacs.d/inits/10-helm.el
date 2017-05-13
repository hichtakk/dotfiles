(use-package helm
  :config
  (use-package helm-config)

  ; see http://emacs-jp.github.io/packages/helm/helm-descbinds.html
  (use-package helm-descbinds
    :config
    ; overwrite describe-bindings "C-h b" as helm-descbinds
    (helm-descbinds-mode)
    )

  ;; see http://d.hatena.ne.jp/syohex/20131016/1381935863
  (defun syohex/helm-etags-select (arg)
    (interactive "P")
    (let ((tag  (helm-etags-get-tag-file))
          (helm-execute-action-at-once-if-one t))
      (when (or (equal arg '(4))
                (and helm-etags-mtime-alist
                     (helm-etags-file-modified-p tag)))
        (remhash tag helm-etags-cache))
      (if (and tag (file-exists-p tag))
          (helm :sources 'helm-source-etags-select :keymap helm-etags-map
                :input (concat (thing-at-point 'symbol) " ")
                :buffer "*helm etags*"
                :default (concat "\\_<" (thing-at-point 'symbol) "\\_>"))
        (message "Error: No tag file found, please create one with etags shell command."))))

  ; helm-gtags
  ; see http://emacs-jp.github.io/packages/helm/helm-gtags.html
  ;     http://qiita.com/sona-tar/items/672df1259a76f082ce42
  (use-package helm-gtags
    :config
    (setq helm-gtags-path-style 'root)
    (setq helm-gtags-auto-update t)
    (add-hook 'helm-gtags-mode-hook
              '(lambda ()
                 (local-set-key (kbd "C-x g") 'helm-gtags-dwim)
                 (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
                 (local-set-key (kbd "M-s") 'helm-gtags-select)
                 ;(local-set-key (kbd "M-p") 'helm-gtags-previous-history)
                 ;(local-set-key (kbd "M-n") 'helm-gtags-next-history)
                 )
              )
    )
  )
