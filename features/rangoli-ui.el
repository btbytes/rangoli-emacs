;; rangoli-ui.el --- ui configuration -*- lexical-binding: t; -*-

;;; Packages

(straight-use-package 'ivy)
(straight-use-package 'ivy-prescient)
(straight-use-package 'ivy-rich)
(straight-use-package 'counsel)
(straight-use-package 'swiper)
(straight-use-package 'hydra)
(straight-use-package 'avy)
(straight-use-package 'gruvbox-theme)
(straight-use-package 'apropospriate-theme)
(straight-use-package 'kaolin-themes)
(straight-use-package 'nord-theme)
(straight-use-package 'alert)
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-ivy)
(straight-use-package 'saveplace)
(straight-use-package 'recentf)
(straight-use-package 'winum)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'ivy-yasnippet)
(straight-use-package 'vlf)
(straight-use-package 'annotate)
(straight-use-package 'restart-emacs)

;;; Require Common Packages

(require 'diminish)

;;; UI

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t)

(delete-selection-mode +1)
(setq-default indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks t)

(global-visual-line-mode +1)
(diminish 'visual-line-mode)

(diminish 'eldoc-mode)

;;; Backup files, Lock files, Auto-Restore, etc.

(setq auto-save-default nil
      make-backup-files nil
      create-lockfiles nil)

(global-auto-revert-mode +1)

;;; mode-line

(setq display-time-load-average-threshold 5)
(display-time)

;;; Narrowing framework - Ivy, Counsel, Swiper
;; https://oremacs.com/swiper/

(setq ivy-use-virtual-buffers t)

(ivy-mode +1)
(diminish 'ivy-mode)
;; Sorting by recency and usage
(ivy-prescient-mode)
(prescient-persist-mode)

(counsel-mode +1)
(diminish 'counsel-mode)

;; https://oremacs.com/2019/04/07/swiper-isearch/
(global-set-key (kbd "C-s") 'swiper-isearch)

(rangoli/set-leader-key "j" 'avy-goto-line "jump to line")
(rangoli/set-leader-key "s j" 'counsel-semantic-or-imenu)

;;; Dired

(setq
 ;; https://emacs.stackexchange.com/a/5604
 dired-dwim-target t

 ;; http://pragmaticemacs.com/emacs/dired-human-readable-sizes-and-sort-by-size/
 dired-listing-switches "-alh")

(rangoli/set-leader-key "f d b" 'dired-jump "dired for current buffer")
(rangoli/set-leader-key "f d d" 'dired "dired, asks for path")
(rangoli/set-leader-key "f d i" 'image-dired "image-dired, asks for path")

;;; Find File actions

(rangoli/set-leader-key "f f" 'counsel-find-file)

;; https://www.emacswiki.org/emacs/InsertFileName
(ivy-add-actions t
                 '(("I" (lambda (x) (with-ivy-window (insert x))) "insert")))
(ivy-add-actions 'counsel-find-file
                 '(("F" (lambda (x) (with-ivy-window (insert (file-relative-name x))))
                    "insert relative file name")
                   ("B" (lambda (x)
                          (with-ivy-window
                            (insert (file-name-nondirectory (replace-regexp-in-string "/\\'" "" x)))))
                    "insert file name without any directory information")))

;;; Recent location

(save-place-mode +1)

(recentf-mode +1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
(rangoli/set-leader-key "f r" 'counsel-recentf)

;;; Annotate

(require 'annotate)
(setq annotate-file (f-join rangoli/home-dir "annotations"))

;;; General key bindings

(defun rangoli/kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun rangoli/switch-to-messages-buffer ()
  (interactive)
  (switch-to-buffer (get-buffer "*Messages*")))

(defun rangoli/switch-to-scratch-buffer ()
  (interactive)
  (switch-to-buffer (get-buffer "*scratch*")))

(defun rangoli/open-init ()
  (interactive)
  (find-file user-init-file))

(defun rangoli/buffer-file-name ()
  "Copy current buffer's file name to clipboard, and display it."
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name)))

;; http://stackoverflow.com/a/10216338/4869
(defun rangoli/copy-whole-buffer-to-clipboard ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun rangoli/cut-whole-buffer-to-clipboard ()
  "Cut entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max))
  (delete-region (point-min) (point-max)))

(defun rangoli/copy-clipboard-to-whole-buffer ()
  "Copy clipboard and replace buffer"
  (interactive)
  (delete-region (point-min) (point-max))
  (clipboard-yank)
  (deactivate-mark))

(defun rangoli/save-some-buffers ()
  (interactive)
  (save-some-buffers
   t
   #'(lambda ()
       (and (not buffer-read-only)
            (buffer-file-name)))))

;; https://github.com/syl20bnr/spacemacs/blob/a69323fb3c09564217145ff4b151d157af39275b/layers/%2Bspacemacs/spacemacs-defaults/funcs.el#L329
(defun rangoli/rename-current-buffer-file ()
  (interactive)
  (let* ((rangoli/buffer-name (buffer-name))
         (rangoli/file-name (buffer-file-name)))
    (if (and rangoli/file-name
             (f-exists? rangoli/file-name))
        (let ((rangoli/new-file-name (read-file-name "New name: ")))
          (if (not (f-exists? rangoli/new-file-name))
              (progn
                (f-move rangoli/file-name rangoli/new-file-name)
                (rename-buffer rangoli/new-file-name)
                (set-visited-file-name rangoli/new-file-name)
                (set-buffer-modified-p nil)
                (message "File '%s' successfully renamed to '%s'"
                         rangoli/buffer-name
                         (f-filename rangoli/new-file-name)))
            (error (s-lex-format "File already exists: ${rangoli/new-file-name}"))))
      (error (s-lex-format "File does not exist : ${rangoli/file-name}")))))

;; https://github.com/syl20bnr/spacemacs/blob/a69323fb3c09564217145ff4b151d157af39275b/layers/%2Bspacemacs/spacemacs-defaults/funcs.el#L420
(defun rangoli/delete-current-buffer-file ()
  (interactive)
  ;; if file exists
  (let* ((rangoli/buffer (current-buffer))
         (rangoli/file-name (buffer-file-name)))
    (if (and rangoli/file-name
             (f-exists? rangoli/file-name))
        (when (y-or-n-p "Are you sure you want to delete this file? ")
          (kill-buffer rangoli/buffer)
          (f-delete rangoli/file-name))
      (error (s-lex-format "File does not exist : ${rangoli/file-name}")))))

(rangoli/set-leader-key "'" 'eshell)
(rangoli/set-leader-key "\"" 'ielm)

(rangoli/set-leader-key "a a" 'annotate-mode "annotate")

(rangoli/set-leader-key "b b" 'ivy-switch-buffer "switch")
(rangoli/set-leader-key "b c" 'rangoli/copy-whole-buffer-to-clipboard "copy buffer to clipboard")
(rangoli/set-leader-key "b d" 'rangoli/kill-current-buffer "delete")
(rangoli/set-leader-key "b h" 'bury-buffer "hide")
(rangoli/set-leader-key "b m" 'rangoli/switch-to-messages-buffer "messages")
(rangoli/set-leader-key "b s" 'rangoli/switch-to-scratch-buffer "scratch")
(rangoli/set-leader-key "b x" 'rangoli/cut-whole-buffer-to-clipboard "cut buffer to clipboard")
(rangoli/set-leader-key "b y" 'rangoli/copy-clipboard-to-whole-buffer "copy clipboard to buffer")

(rangoli/set-leader-key "f D" 'rangoli/delete-current-buffer-file)
(rangoli/set-leader-key "f R" 'rangoli/rename-current-buffer-file)
(rangoli/set-leader-key "f s" 'save-buffer)
(rangoli/set-leader-key "f S" 'rangoli/save-some-buffers)
(rangoli/set-leader-key "f e d" 'rangoli/open-init "open dot emacs file")
(rangoli/set-leader-key "f v" 'revert-buffer)
(rangoli/set-leader-key "f y" 'rangoli/buffer-file-name "current file name")

(rangoli/set-leader-key "i u" 'counsel-unicode-char "unicode")

(rangoli/set-leader-key "l" 'browse-url-at-point)
(when (eq system-type 'gnu/linux)
  (rangoli/set-leader-key "L" 'xwidget-webkit-browse-url))

(rangoli/set-leader-key "o a" 'org-agenda "agenda")
(rangoli/set-leader-key "o c" 'org-capture "capture")

(rangoli/set-leader-key "q q" 'save-buffers-kill-terminal)
(rangoli/set-leader-key "q r" 'restart-emacs)

(rangoli/set-leader-key "a d c" 'calendar "show calendar")
(rangoli/set-leader-key "a d w" 'display-time-world "show world time")

(rangoli/set-leader-key "w =" 'balance-windows-area)
(rangoli/set-leader-key "w d" 'delete-window)
(rangoli/set-leader-key "w f" 'toggle-frame-maximized)
(rangoli/set-leader-key "w m" 'delete-other-windows)
(rangoli/set-leader-key "w s" 'split-window-below)
(rangoli/set-leader-key "w v" 'split-window-right)
(rangoli/set-leader-key "w w" 'other-window)

;;; Window management
(winum-mode)

(rangoli/set-leader-key "1" 'winum-select-window-1)
(rangoli/set-leader-key "2" 'winum-select-window-2)
(rangoli/set-leader-key "3" 'winum-select-window-3)
(rangoli/set-leader-key "4" 'winum-select-window-4)
(rangoli/set-leader-key "5" 'winum-select-window-5)
(rangoli/set-leader-key "6" 'winum-select-window-6)
(rangoli/set-leader-key "7" 'winum-select-window-7)
(rangoli/set-leader-key "8" 'winum-select-window-8)
(rangoli/set-leader-key "9" 'winum-select-window-9)

;;; YASnippet + snippet expansion
(require 'yasnippet)
(when (f-exists? rangoli/private-emacs-config-dir)
  ;; I want snippets stored only in my private emacs config repository, /not/ in the public rangoli-emacs repository.
  ;; http://joaotavora.github.io/yasnippet/snippet-organization.html#org10ee311
  (setq yas-snippet-dirs (-remove
                        (lambda (item) (s-equals? (f-expand "~/.emacs.d/snippets") item))
                        yas-snippet-dirs))
  (add-to-list 'yas-snippet-dirs (f-join rangoli/private-emacs-config-dir "snippets")))
(yas-global-mode 1)
(diminish 'yas-minor-mode)

(rangoli/set-leader-key "i s" 'ivy-yasnippet "snippet")

(global-set-key (kbd "M-/") 'hippie-expand)
(add-to-list 'hippie-expand-try-functions-list ' yas-hippie-try-expand)

;;; Notifications

;; https://github.com/jwiegley/alert#builtin-alert-styles
(setq alert-default-style
      (pcase system-type
        ('darwin 'notifier) ;; requires `terminal-notifier` command
        ('gnu/linux 'notifications)) ;; Uses notifications library via D-Bus
      )

;;; Icons

(require 'all-the-icons)

(require 'all-the-icons-ivy)
(all-the-icons-ivy-setup)

(require 'ivy-rich)
(ivy-rich-mode 1)

;;; Symbols

(global-prettify-symbols-mode)

;;; very large files
;; https://writequit.org/articles/working-with-logs-in-emacs.html

(require 'vlf-setup)

;;; very long lines
;; https://www.reddit.com/r/emacs/comments/ccoksw/solong_mitigating_slowness_due_to_extremely_long/

(global-so-long-mode)

;;; Font

;; Need a font that supports emoji
;; https://www.google.com/get/noto/
(defvar rangoli/font-name "Noto Mono")
(defvar rangoli/font-size 15.0)
(defvar rangoli/font-size-bigger 16.0)
(defvar rangoli/font (s-lex-format "${rangoli/font-name}-${rangoli/font-size}"))
(defvar rangoli/font-bigger (s-lex-format "${rangoli/font-name}-${rangoli/font-size-bigger}"))

(set-frame-font rangoli/font nil t)

(defun rangoli/bigger-font-size ()
  (interactive)
  (set-frame-font rangoli/font-bigger nil t))
(rangoli/set-leader-key "+" 'rangoli/bigger-font-size "bigger font size")

(defun rangoli/reset-font-size ()
  (interactive)
  (set-frame-font rangoli/font nil t))
(rangoli/set-leader-key "-" 'rangoli/reset-font-size "reset font size")

;;; Theme-specific config

(require 'apropospriate)
(setq apropospriate-org-level-resizing nil)

(require 'kaolin-themes)
(setq kaolin-themes-org-scale-headings nil)

;;; Default Theme

(defvar rangoli/default-theme-light 'gruvbox-light-hard)
(defvar rangoli/default-theme-dark 'gruvbox-dark-hard)

(defun rangoli/mac-appearance ()
  "Is Mac currently using light or dark appearance?"
  (when (eq system-type 'darwin)
    (if (s-contains? "Dark"
                     (shell-command-to-string "defaults read -g AppleInterfaceStyle"))
        "dark"
      "light")))

(defun rangoli/day-time? ()
  "Is now between 6am and 5pm?"
  (< 5 (ts-hour (ts-now)) 17))

(defun rangoli/theme-light-or-dark? ()
  (if (display-graphic-p)

      (if-let ((mac-appearance (rangoli/mac-appearance)))
          mac-appearance
        
        (if (rangoli/day-time?)
            ;; GUI + day
            "light"
          ;; GUI + evening
          "dark"))
    
    ;; Terminal
    "dark"))

(defvar rangoli/theme-type nil "light or dark.")

(defun rangoli/load-theme-light ()
  (interactive)
  (setq rangoli/theme-type "light")
  (counsel-load-theme-action (symbol-name rangoli/default-theme-light))
  (when (eq system-type 'darwin)
    (modify-all-frames-parameters '((ns-transparent-titlebar . t) (ns-appearance . light)))))

(defun rangoli/load-theme-dark ()
  (interactive)
  (setq rangoli/theme-type "dark")
  (counsel-load-theme-action (symbol-name rangoli/default-theme-dark))
  (when (eq system-type 'darwin)
    (modify-all-frames-parameters '((ns-transparent-titlebar . t) (ns-appearance . dark)))))

(if (s-equals? "light" (rangoli/theme-light-or-dark?))
    (rangoli/load-theme-light)
  (rangoli/load-theme-dark))

;;; Theme switcher

(defun rangoli/theme-cycle ()
  (interactive)
  (if (s-equals? "light" rangoli/theme-type)
      (rangoli/load-theme-dark)
    (rangoli/load-theme-light)))

(rangoli/set-leader-key "T n" 'rangoli/theme-cycle "next")
(rangoli/set-leader-key "T s" 'counsel-load-theme "switch")

;;; Frame size

(run-with-idle-timer 0.1 nil 'toggle-frame-maximized)

(provide 'rangoli-ui)
;; rangoli-ui.el ends here
