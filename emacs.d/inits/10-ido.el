; IDO: Interactively Do Things
; https://www.emacswiki.org/emacs/InteractivelyDoThings
;
; see:
;  http://fnwiya.hatenablog.com/entry/2015/10/17/211547

(use-package ido
  :bind (("M-r" . recentf-ido-find-file)
         )
  :init
  ; recent-file completion
  ; https://www.emacswiki.org/emacs/RecentFiles#toc8
  (defun recentf-ido-find-file ()
    "Find a recent file using Ido."
    (interactive)
    (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
      (when file
        (find-file file))))
  :config
  (ido-mode)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t)

  ; makes ido-mode display vertically
  ; see: https://github.com/creichert/ido-vertical-mode.el
  (use-package ido-vertical-mode
    :config
    (ido-vertical-mode t)
    (setq
     ido-vertical-show-count t
     ido-vertical-define-keys 'C-n-C-p-up-down-left-right
     )
    )

  ; A smart M-x enhancement for Emacs.
  ; see: https://github.com/nonsequitur/smex
  ;      http://emacs.rubikitch.com/smex/
  (use-package smex
    :bind (("M-x" . smex)
           ("M-X" . smex-major-mode-commands)
           )
    :config
    (smex-initialize)
    )
  
  (use-package ido-describe-bindings
    :bind (("C-x ?" . ido-describe-bindings))
  )
