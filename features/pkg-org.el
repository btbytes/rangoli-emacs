;; pkg-org.el --- personal orgmode configuration -*- lexical-binding: t; -*-
(require 'rangoli-org)

;; (setq rangoli/notes-dir (f-expand "~/btbytes/notes/"))
;; (defvar rangoli/notes-dir (f-expand "~/btbytes/notes"))

(setq org-html-postamble t
      org-export-with-toc nil
      org-export-with-section-numbers nil
      org-export-with-todo-keywords nil
      org-export-with-author nil
      org-export-with-creator nil
      org-export-with-special-strings nil
)

(provide 'pkg-org)
;; pkg-org.el ends here

