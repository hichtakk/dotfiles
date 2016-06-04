(use-package go-mode
  :commands go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
)

(use-package go-autocomplete
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH"))
)

