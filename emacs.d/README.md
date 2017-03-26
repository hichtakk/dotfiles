~/.emacs.d
-----------

# Requirements

* Emacs 24.x or higher
* Cask (https://github.com/cask/cask)

# Cask
http://cask.readthedocs.org
Cask is package management tool for Emacs.

## Installation
### Manual installation

```
% curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

### Package managers

```
% brew install cask
```

## Install Emacs-lisp packages from Cask

```
% cd ~/.emacs.d
% make install
```

# Python
## Install Jedi
Auto completion for Python

```
M-x jedi:install-server
```

## Install pyflakes
flycheck and autopep8

```
% source ~/.emacs.d/.python-environments/default/bin/activate
% pip install -r ~/.emacs.d/.python-environments/requirements.txt
```
