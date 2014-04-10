;; syntax highlight
(global-font-lock-mode t)
;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(let ((default-directory "~/.emacs.d/lisp/"))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path)))
	   (normal-top-level-add-subdirs-to-load-path))
	 load-path)))


;; color-theme
(require 'color-theme)
;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;; share os clipboard
(setq x-select-enable-clipboard t)
;; end sharing os clipboard


;; code highlight in org-mode
(setq org-src-fontify-natively t)

;; org mode todo list settings
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-todo-keywords
      '((type "work" "home")))

;; textile mode
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))


;; load todo list mode automaticaly
(autoload 'todo-list-mode "todo-list-mode") ;load when needed

;; a simple function that opens the file and switches to todo-list-mode
(defun open-todo-list ()
  (interactive)
  (find-file "~/notes/TODO") ;path to my todo list
  (todo-list-mode))

;; then bind to control-f12 so i can call it with one keystroke
(global-set-key [C-f12] 'open-todo-list)


;; slime settings
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(require 'slime)
(slime-setup)
(require 'slime-autoloads)


;; auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)