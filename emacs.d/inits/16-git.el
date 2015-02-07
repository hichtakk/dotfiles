; git client
(use-package magit
  :config
  (global-set-key (kbd "C-c g") 'magit-status)
  ; see http://stackoverflow.com/questions/23802485/what-is-emacs-mrev-mode
  (magit-auto-revert-mode -1)
  (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient")
  )

; see https://github.com/syohex/emacs-git-gutter
;     http://emacs-jp.github.io/packages/vcs/git-gutter.html
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  )
