;;; packages.el --- julia layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Marcio Giaxa Marinheiro <marciogiaxa@gmail.com>
;; URL: https://github.com/marciogm/julia-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
;;; Code:

(defconst julia-packages
  '((julia-mode :location (recipe
                          :fetcher github
                          :repo "JuliaEditorSupport/julia-emacs"))
    (julia-repl :location (recipe
                           :fetcher github
                           :repo "tpapp/julia-repl"))
    (flycheck-julia))
  "The list of Lisp packages required by the julia layer.")

(defvar julia-executable "julia")

(defun julia/init-julia-mode ()
  (use-package julia-mode
    :defer t))

(defun julia/init-julia-repl ()
  (use-package julia-repl
    :defer t
    :init
    (progn
      (setq julia-repl-executable julia-executable)
      (add-hook 'julia-mode-hook 'julia-repl-mode)
      (spacemacs/set-leader-keys-for-major-mode 'julia-repl-mode
        "s'" 'julia-repl--start-inferior
        "sc" 'julia-repl-send-region-or-line
        "sb" 'julia-repl-send-buffer
        "sl" 'julia-repl-send-line
        "e" 'julia-repl-edit
        "d" 'julia-repl-doc
        "w" 'julia-repl-workspace
        "m" 'julia-repl-macroexpand))))

(defun julia/init-flycheck-julia ()
  (use-package flycheck-julia
    :defer t
    :init
    (progn
      (setq flycheck-julia-executable julia-executable)
      (flycheck-julia-setup)))
  )

;;; packages.el ends here
