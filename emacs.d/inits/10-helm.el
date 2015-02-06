(use-package helm
  :config
  (use-package helm-config)
  (use-package helm-descbinds)
  (use-package helm-gtags)

  (helm-descbinds-mode)

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
  )
