; ~/.emacs.d/init.el
(setq debug-on-error t)

; Package management tool
; see https://
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'anzu)
(package-install 'bind-key)
(package-install 'direx)
(package-install 'epc)
(package-install 'erlang)
(package-install 'exec-path-from-shell)
(package-install 'expand-region)
(package-install 'flycheck)
(package-install 'git-gutter)
(package-install 'helm)
(package-install 'helm-descbinds)
(package-install 'helm-gtags)
(package-install 'init-loader)
(package-install 'jedi)
(package-install 'jedi-direx)
(package-install 'git)
(package-install 'markdown-mode)
(package-install 'open-junk-file)
(package-install 'popwin)
(package-install 'powerline)
(package-install 'py-autopep8)
(package-install 'python)
(package-install 'python-environment)
(package-install 'recentf-ext)
(package-install 'use-package)
(package-install 'virtualenvwrapper)
(package-install 'yaml-mode)
(package-install 'zenburn-theme)
(package-install 'go-mode)
(package-install 'go-autocomplete)


; use-package
; see https://github.com/jwiegley/use-package
;     http://qiita.com/kai2nenobu/items/5dfae3767514584f5220
(unless (require 'use-package nil t)
  (defmacro use-package (&rest args)))

; init-loader
; see https://github.com/emacs-jp/init-loader
(use-package init-loader
  :config
  (setq init-loader-show-log-after-init t)
  (init-loader-load "~/.emacs.d/inits"))
