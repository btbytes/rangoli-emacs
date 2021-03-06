;; pkg-nim.el --- nim language configuration -*- lexical-binding: t; -*-
(straight-use-package 'nim-mode)
(require 'nim-mode)

(setq nimsuggest-path (f-expand "~/.nimble/bin/nimsuggest"))
(setq nimlsp-path (f-expand "~/.nimble/bin/nimlsp"))

(defun my--init-nim-mode ()
  "Local init function for `nim-mode'."

  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" buffer-file-name) (read-only-mode 1))

  ;; If you want to experiment, you can enable the following modes by
  ;; uncommenting their line.
  ;; (nimsuggest-mode 1)
  ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
  ;; (flycheck-mode 1)
  ;; (flymake-mode 1)

  ;; The following modes are disabled for Nim files just for the case
  ;; that they are enabled globally.
  ;; Anything that is based on smie can cause problems.
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)
(add-to-list 'lsp-language-id-configuration '(nim-mode "nim" . "nims"))
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection nimlsp-path)
                  :major-modes '(nim-mode)
                  :server-id 'nimlsp))
(add-hook 'nim-mode-hook #'lsp)

(add-hook 'nim-mode-hook 'my--init-nim-mode)

(provide 'pkg-nim)
