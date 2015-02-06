(use-package recentf
  :init
  (setq recentf-save-file "~/.emacs.d/.recentf")
  :config
  (setq recentf-max-saved-items 100)

  ; recentf extention
  ; see http://d.hatena.ne.jp/rubikitch/20091224/recentf
  (use-package recentf-ext)
  )
