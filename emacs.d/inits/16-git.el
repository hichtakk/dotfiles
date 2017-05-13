; git client
(use-package git

  )

; see https://github.com/syohex/emacs-git-gutter
;     http://emacs-jp.github.io/packages/vcs/git-gutter.html
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (custom-set-variables
   '(git-gutter:modified-sign "*"))
  (set-face-foreground 'git-gutter:modified "#93A2CC")
  )
