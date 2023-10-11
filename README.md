# Setting up Emacs

Add the following to emacs init file

```
;; Julia
(use-package vterm
    :ensure t)
(use-package julia-mode
  :ensure t)
(use-package julia-repl
  :ensure t
  :hook (julia-mode . julia-repl-mode)
  :init
  (setenv "JULIA_NUM_THREADS" "8")
  :config
  ;; Set the terminal backend
  (julia-repl-set-terminal-backend 'vterm))
```

Julia commands

```
julia-repl-send-cell
julia-repl-send-line
julia-repl-send-buffer
```

For example, `C-c C-b` is bound to `julia-repl-send-buffer` and will send the buffer 
to the Julia repl and run the buffer

# LSP Mode

If LSP integration is needed add the following to emacs init.

```
(quelpa '(lsp-julia :fetcher github
                    :repo "non-Jedi/lsp-julia"
                    :files (:defaults "languageserver")))

(use-package lsp-julia
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

(add-hook 'julia-mode-hook #'lsp-mode)
```

# Jupyter

From julia

```
using IJulia
notebook()
```

From standalone jupyter.  Make sure jupyter is installed 
```
brew update
brew install jupyterlab
jupyter lab 
```

This will open a jupyter notebook where Julia interpreter can be started.
See https://github.com/JuliaLang/IJulia.jl#quick-start

# References

* https://hershsingh.net/blog/emacs-julia/
* https://probability4datascience.com/
* https://sciml.ai/
