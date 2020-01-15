;; pkg-html.el --- HTML configuration -*- lexical-binding: t; -*-

(straight-use-package 'zencoding-mode)
(straight-use-package 'jinja2-mode)

(add-hook 'html-mode-hook 'zencoding-mode)
(provide 'pkg-html)
;; pkg-html.el ends here
