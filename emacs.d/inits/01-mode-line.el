; Mode line settings

;; show current function name in modeline
;(which-function-mode t)

; powerline
; see https://github.com/milkypostman/powerline
; http://blog.shibayu36.org/entry/2014/02/11/160945

; powerline custom theme
(defun powerline-my-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (powerline-buffer-size nil 'l)
                                     (powerline-buffer-id nil 'l)
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format face2 'l))
                                     (powerline-minor-modes face2 'l)
                                     (powerline-narrow face2 'l)
                                     (powerline-raw " " face2)
                                     ))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw " " face1)
                                     (powerline-vc face1 'r)
                                     (funcall separator-right face1 nil)
                                     (powerline-raw "%4l" nil 'l)
                                     (powerline-raw ":" nil 'l)
                                     (powerline-raw "%3c " nil 'r)
                                     (powerline-hud face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))


(use-package powerline
  :config
  (powerline-my-theme)
  ; customize color
  (set-face-attribute 'mode-line nil
                      :foreground "#FFFACD"
                      :background "#3A539B"
                      :box nil)
  (set-face-attribute 'powerline-active1 nil
                      :background "#4682B4"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-active2 nil
                      :background "#5F5F5F"
                      :inherit 'mode-line)

  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#FFFACD"
                      :background "#333333"
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :background "#5F5F5F"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :background "#808080"
                      :inherit 'mode-line)
  )
