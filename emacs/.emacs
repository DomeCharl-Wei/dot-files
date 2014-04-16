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


;; Indent
(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
(dolist (hook (list
	       'emacs-lisp-mode-hook
	       'lisp-mode-hook
	       'lisp-interaction-mode-hook
	       'scheme-mode-hook
	       'c-mode-hook
	       'c++-mode-hook
	       'haskell-mode-hook
	       'asm-mode-hook
	       'emms-tag-editor-mode-hook
	       'sh-mode-hook
	       ))
  (add-hook hook '(lambda () (setq indent-tabs-mode nil))))

;; emacs-w3m reads RSS
(setq newsticker-url-list
      '(("Washington Post" "http://feeds.washingtonpos.com/rss/world")
        ("ScienceDaily" "http://www.sciencedaily.com/rss")
        ("PAMI" "http://csdl.computer.org/rss/tpami.xml")
        ("Knowledge Mining" "http://csdl.computer.org/rss/tkde.xml")
        ("Learning Technologies" "http://csdl.computer.org/rss/tlt.xml")
        ("news 163" "http://news.163.com/special/00011K6L/rss_newstop.xml")))
(autoload 'w3m-region "w3m" nil t)
(setq newsticker-html-renderer 'w3m-region)



;; dict settings
(global-set-key (kbd "C-c d") 'SearchStardict)
(defun SearchStardict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (message "%s"
             (shell-command-to-string
              (concat "sdcv -n -u XDICT英汉辞典  "
                      (buffer-substring begin end))))))