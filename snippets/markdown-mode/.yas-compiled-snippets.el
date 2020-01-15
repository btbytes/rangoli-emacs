;;; Compiled snippets and support files for `markdown-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'markdown-mode
                     '(("today" "`(format-time-string \"%a, %b %-d, %Y\")`" "today" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/today" nil nil)
                       ("post" "---\ntitle: $1\ndate: `(format-time-string \"%Y-%m-%d\")`\ndescription: $2\ntags: $3\nkind: post\n---\n\n$4" "new post" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/post" nil nil)
                       ("now" "`(format-time-string \"%Y-%m-%dT%H:%M:%S\")`" "now" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/now" nil nil)
                       ("notebook" "---\ntitle: $1\ndate: `(format-time-string \"%Y-%m-%d\")`\nkind: notebook\n---\n\n$2" "notebook" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/notebook" nil nil)
                       ("newlog" "## `(format-time-string \"%a, %b %-d, %Y\")`\n" "new log entry" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/newlog" nil nil)
                       ("newlink" "<article id='`(format-time-string \"%b%d-%H%M\")`' data-epoch=`(format-time-string \"%s\")` class=\"links-article\">\n<p><a class=\"links-url\"href=\"$1\">$2</a>\n<span class=\"links-description\">$3</span>\n<span class=\"links-permalink\"><a href=#`(format-time-string \"%b%d-%H%M\")`>&para;</a></span>\n</p>\n</article>" "new link" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/newlink" nil nil)
                       ("link" "---\nurl: $1\ntitle: $2\nslug: $3\ndate: `(format-time-string \"%Y-%m-%d\")`\nkind: link\n---\n\n$4" "link" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/link" nil nil)
                       ("journal" "---\ntitle: $1\ndate: `(format-time-string \"%Y-%m-%d\")`\nkind: journal\n---\n\n$2" "journal" nil nil nil "/Users/pgowda/.config/emacs/snippets/markdown-mode/journal" nil nil)))


;;; Do not edit! File generated at Sun Jan  5 11:38:24 2020
