;;; config.el -*- lexical-binding: t; -*-

(setq
 user-full-name "Zed Kaido"
 user-mail-address "dm@zedkaido.com")

(setq auth-sources '("~/.doom.d/.authinfo.gpg"))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default delete-by-moving-to-trash t
							line-number-mode 1 ;; (modeline)
							column-number-mode 1 ;; (modeline)
							global-display-line-numbers-mode nil
							global-hl-line-mode nil
							global-hl-line-modes nil
							display-line-numbers-type nil
							editorconfig-mode 1
							indent-tabs-mode t
							tab-width 3)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(defun rename-file-and-buffer ()
	"Rename the current buffer and the file it is visiting."
	(interactive)
	(let ((filename (buffer-file-name)))
		(if (not (and filename (file-exists-p filename)))
	(message "Buffer is not visiting a file!")
			(let ((new-name (read-file-name "New name: " filename)))
	(cond ((vc-backend filename) (vc-rename-file filename new-name))
							(t (rename-file filename new-name t)
		 (set-visited-file-name new-name t)))
	))))

(setq-default bidi-paragraph-direction 'left-to-right)

(global-so-long-mode 1)

(setq gc-cons-threshold 24242424)

(setq
 doom-font (font-spec :family "JetBrains Mono" :size 13)
 doom-big-font (font-spec :family "JetBrains Mono" :size 13)
 doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 13)
 doom-serif-font (font-spec :family "JetBrains Mono" :size 13))

(load-theme 'zk-white t)

(setq evil-normal-state-cursor '(box)
			evil-insert-state-cursor '(box)
			evil-visual-state-cursor '(hollow)
			evil-operator-state-cursor '(box "#404040")
			evil-replace-state-cursor '(hollow))

(setq-default mode-line-buffer-identification
							'(:eval (propertize
											 (concat (abbreviate-file-name (file-name-directory buffer-file-name))
															 (file-name-nondirectory buffer-file-name))
											 'face 'mode-line-filename)))

(setq-default
 mode-line-format
 '("%e"
	 mode-line-front-space
	 mode-line-mule-info
	 mode-line-client
	 mode-line-modified
	 mode-line-remote
	 mode-line-frame-identification
	 mode-line-buffer-identification
	 "   "
	 "<ETC?>" ;; ETC Reminder (Easier To Change)
	 "   "
	 mode-line-position
	 (vc-mode vc-mode)
	 "  "
	 mode-name
	 "  "
	 mode-line-process
	 "  "
	 mode-line-misc-info mode-line-end-spaces))

(setq evil-mode-line-format '(before . mode-line-front-space))

(map! :leader
			(:prefix "b"
			 :desc "Display fill-column indicator"    "f" #'display-fill-column-indicator-mode))

(map!
 :leader
 (:prefix-map ("f" . "file")
							(:prefix-map ("g" . "goto")
							 :desc "tmp"          "t" (cmd! (find-file "/tmp"))
							 :desc "drive"        "/" (cmd! (find-file "/"))
							 :desc "home"         "h" (cmd! (find-file "~"))
							 :desc "zk"           "z" (cmd! (find-file "~/zk"))
							 :desc "books"        "g" (cmd! (find-file "~/zk/books"))
							 :desc "Org Roam"       "g" (cmd! (find-file "~/zk/org"))
							 :desc "projects"     "p" (cmd! (find-file "~/zk/projects"))
							 :desc "music"        "m" (cmd! (find-file "~/zk/music"))
							 :desc "desktop"      "D" (cmd! (find-file "~/Desktop"))
							 :desc "downloads"    "d" (cmd! (find-file "~/Downloads"))
							 )))

(map!
 :leader
 (:prefix-map ("c" . "code")
							(:prefix-map ("b" . "Counsel")
							 :desc "Find" "/" 'counsel-dash
							 :desc "Find (by Cursor)" "." 'counsel-dash-at-point
							 :desc "Activate Doc in Buffer" "a" 'counsel-dash-activate-docset
							 :desc "Deactivate Doc to Buffer" "d" 'counsel-dash-deactivate-docset)))

(map!
 :leader
 (:prefix-map ("t" . "toggle")
	:desc "Org-Roam Buffer" "o" 'org-roam-buffer-toggle-display
	:desc "Composition Mode (Ligatures)" "c" 'toggle-auto-composition))

(setq calc-angle-mode 'rad
			calc-algebraic-mode t ;; allows '2*x instead of 'x<RET>2*
			calc-symbolic-mode t) ;; keeps stuff like √2 irrational for as long as possible

(after! company
	(setq company-idle-delay nil)
	(add-hook 'evil-normal-state-entry-hook #'company-abort))

(setq-default history-length 50)
(setq-default history-delete-duplicates t)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
			 "--use-tabs" "true"
			 "--tab-width" 2
			 "--single-quote" "true"
			 "--trailing-comma" "all"
			 "--bracket-spacing" "false"
			 ))

(setq which-key-idle-delay 0.5) ;; I need the help, I really do

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(setq dumb-jump-default-project "~/main")

(after! evil (evil-escape-mode -1))

(setq which-key-allow-multiple-replacements t)
(after! which-key
	(pushnew!
	 which-key-replacement-alist
	 '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
	 '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
	 ))

(global-disable-mouse-mode)
;; And, for evil's individual states.
(mapc #'disable-mouse-in-keymap
      (list evil-motion-state-map
            evil-normal-state-map
            evil-visual-state-map
            evil-insert-state-map))

(setq nov-text-width 100)
(use-package! nov
	:mode ("\\.epub\\'" . nov-mode)
	:config
	(setq nov-save-place-file (concat doom-cache-dir "nov-places")))

(add-hook 'dired-mode-hook 'org-download-enable)
(setq org-download-image-dir "~/zk/org/images")

(setq org-roam-directory "~/zk/org")

(use-package! websocket
	:after org-roam)

(use-package! org-roam-ui
	:after org-roam ;; or :after org
	;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
	;;         a hookable mode anymore, you're advised to pick something yourself
	;;         if you don't care about startup time, use
	;;  :hook (after-init . org-roam-ui-mode)
	:config
	(setq org-roam-ui-sync-theme t
				org-roam-ui-follow t
				org-roam-ui-update-on-save t
				org-roam-ui-open-on-start t))

(use-package! org-pandoc-import :after org)

(setq projectile-project-search-path '("~/zk"))
(setq projectile-ignored-projects
			(list "~/" "/tmp"))

(setq +ligatures-in-modes '(not org-mode special-mode))

(setq engine-mode t)

(defengine brave
	"https://search.brave.com/search?q=%s"
	:keybinding "b"
	:browser 'eww-browse-url)

(defengine hoogle
	"https://hoogle.haskell.org/?hoogle=%s"
	:keybinding "h"
	:browser 'eww-browse-url)

(setq elfeed-feeds
			'("http://nullprogram.com/feed/"
	"https://planet.emacslife.com/atom.xml"
	"https://zedkaido.com/rss.xml"
	"https://lukesmith.xyz/index.xml"
	"https://stallman.org/rss/rss.xml"
	))

(setq +lookup-provider-url-alist
			'(
				("DuckDuckGo" +lookup--online-backend-duckduckgo "https://duckduckgo.com/?q=%s")
				("Hoogle" "https://hoogle.haskell.org/?hoogle=%s")
				("Google" +lookup--online-backend-google "https://google.com/search?q=%s")
				("Google images" "https://www.google.com/images?q=%s")
				("Google maps" "https://maps.google.com/maps?q=%s")
				("Project Gutenberg" "http://www.gutenberg.org/ebooks/search/?query=%s")
				("Archive" "https://archive.org/searchresults.php?search=%s&sin=&limit=100&fts_terms=&start=0&searchAll=yes&submit=this+was+submitted")
				("PDFdrive" "https://www.pdfdrive.com/search?q=%s&pagecount=&pubyear=&searchin=&em=")
				("DevDocs.io" "https://devdocs.io/#q=%s")
				("StackOverflow" "https://stackoverflow.com/search?q=%s")
				("Github" "https://github.com/search?ref=simplesearch&q=%s")
				("Youtube" "https://youtube.com/results?aq=f&oq=&search_query=%s")
				("Twitter" "https://twitter.com/search?q=%s")
				("Wolfram alpha" "https://wolframalpha.com/input/?i=%s")
				("Wikipedia" "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")
				("MDN" "https://developer.mozilla.org/en-US/search?q=%s")
				("Rust Docs" "https://doc.rust-lang.org/std/?search=%s")
				("Doom Emacs issues" "https://github.com/hlissner/doom-emacs/issues?q=is%%3Aissue+%s")
				)
			)

(defun my-fetch-password (&rest params)
  (require 'auth-source)
  (let ((match (car (apply 'auth-source-search params))))
    (if match
        (let ((secret (plist-get match :secret)))
          (if (functionp secret)
              (funcall secret)
            secret))
      (error "Password not found for %S" params))))

(defun my-nickserv-password (server)
  (my-fetch-password :user "zedkaido" :machine "irc.libera.chat"))

(setq circe-network-options
      '(("Libera Chat"
         :nick "zedkaido"
         :channels ("#web" "#internet" "200ok" "haskell")
         :nickserv-password my-nickserv-password)))

(setq +zen-text-scale 0.8)

(setq org-directory "~/.org"
			org-log-done 'time
			org-export-in-background t
			org-catch-invisible-edits 'smart)

(after! org
	(setq org-fontify-quote-and-verse-block nil
	org-fontify-whole-heading-line nil
	org-hide-leading-stars nil
	))

;; (setq lsp-lens-enable nil
;;       lsp-auto-execute-action nil
;;       lsp-before-save-edits nil
;;       lsp-ui-sideline-enable nil
;;       lsp-modeline-code-actions-mode t
;;       lsp-headerline-breadcrumb-enable nil)

(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))

(require 'org-ai)
(add-hook 'org-mode-hook #'org-ai-mode)

(setq org-ai-default-chat-model "gpt-3.5-turbo")
;; (setq org-ai-default-chat-model "gpt-4")

(defun kill-other-buffers ()
	"Kill all other buffers."
	(interactive)
	(mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-dired-buffers ()
  "Kill all open dired buffers."
  (interactive)
  (mapc (lambda (buffer)
	  (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
	    (kill-buffer buffer)))
	(buffer-list)))

(mapc (lambda (mode)
	(evil-set-initial-state mode 'emacs)) '(elfeed-show-mode
						efleed-search-mode
						forge-pullreq-list-mode
						image-dired-mode
						image-dired-thumbnail-mode
						Info-mode
						))
