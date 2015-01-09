; python major mode settings

(when (locate-library "python")
  (autoload 'python "python" nil t)
  (eval-after-load "python"
    ; completion (require python package 'jedi', 'epc')
    (require 'epc)
    (require 'jedi)
    (add-hook 'python-mode-hook 'jedi:ac-setup)
    (setq jedi:complete-on-dot t)

    ; syntax check (require python package 'flake8')
    (when (locate-library "flycheck")
      (add-hook 'python-mode-hook 'flycheck-mode)
      )

    ; tidy up (require python package 'autopep8')
    (when (locate-library "py-autopep8")
      (require 'py-autopep8)
      (add-hook 'before-save-hook 'py-autopep8-before-save)
      )
    )
  )
