; python major mode settings

(use-package python
  ;:commands (python)
  :init
  (defvar virtualenv-name "default")
  (defvar virtualenv-directory "~/.emacs.d/.python-environments")
  :config
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  (add-hook 'python-mode-hook
            '(lambda ()
               (local-set-key "\C-xp" 'jedi-direx:pop-to-buffer))
            )
  )


; virtualenv management
; ---------------------
; see https://github.com/porterjamesj/virtualenvwrapper.el
;
; After 'jefi:install-server', install python packages.
; pip install -r ~/.emacs.d/python-environments/requirements.txt
(use-package virtualenvwrapper
  :config
  ; use same virtualenv which jedi creates
  (setq venv-location virtualenv-directory)
  (venv-workon virtualenv-name)
  )


; auto completion
; ---------------
; see https://github.com/tkf/emacs-jedi
;     http://tkf.github.io/emacs-jedi
;
; After package installation or update, type command below
; to create virtualenv and install or update jediepcserver.
; M-x jedi:install-server RET
(use-package jedi
  :init
  (setq jedi:environment-root virtualenv-name)
  :config
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup)
  ; jedi-direx
  ; see https://github.com/tkf/emacs-jedi-direx
  (add-hook 'jedi-mode-hook 'jedi-direx:setup)
  )


; tidy up (require python package 'autopep8')
; see https://github.com/paetzke/py-autopep8.el
(use-package py-autopep8
  :config
  (add-hook 'before-save-hook 'py-autopep8-before-save)
  (setq py-autopep8-options '("--max-line-length=80"))
  )


; syntax check
; for python, use flycheck and flake8 (python package)
; see ./12-flycheck.el
;     http://flake8.readthedocs.org
(use-package flycheck
  :init
  (add-hook 'python-mode-hook 'flycheck-mode)
  :config
  (setq flycheck-flake8-maximum-line-length 80)
  )
