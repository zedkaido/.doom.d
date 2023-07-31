;; -*- no-byte-compile: t; -*-

;; [[file:config.org::*All The Fun][All The Fun:1]]
(package! spray)
;; All The Fun:1 ends here

;; [[file:config.org::*All The Fun][All The Fun:2]]
(package! speed-type)
;; All The Fun:2 ends here

;; [[file:config.org::*Convenient][Convenient:1]]
(package! org-pandoc-import
	:recipe (:host github
					 :repo "tecosaur/org-pandoc-import"
					 :files ("*.el" "filters" "preprocessors")))
;; Convenient:1 ends here

;; [[file:config.org::*Convenient][Convenient:2]]
(package! command-log-mode)
;; Convenient:2 ends here

;; [[file:config.org::*Convenient][Convenient:3]]
(package! dumb-jump)
;; Convenient:3 ends here

;; [[file:config.org::*Convenient][Convenient:4]]
(package! elisp-format)
;; Convenient:4 ends here

;; [[file:config.org::*Convenient][Convenient:5]]
(package! engine-mode)
;; Convenient:5 ends here

;; [[file:config.org::*Convenient][Convenient:6]]
(package! nov)
;; Convenient:6 ends here

;; [[file:config.org::*Convenient][Convenient:7]]
(package! transpose-frame)
;; Convenient:7 ends here

;; [[file:config.org::*Convenient][Convenient:8]]
(package! screenshot :recipe (:local-repo "lisp/screenshot"))
;; Convenient:8 ends here

;; [[file:config.org::*Convenient][Convenient:9]]
(unpin! org-roam) ;; use the latest version of org-roam
(package! org-roam-ui)
;; Convenient:9 ends here

;; [[file:config.org::*Convenient][Convenient:10]]
(package! keycast)
;; Convenient:10 ends here

;; [[file:config.org::*Convenient][Convenient:11]]
(package! disable-mouse)
;; Convenient:11 ends here

;; [[file:config.org::*Language Support][Language Support:1]]
(package! svelte-mode)
;; Language Support:1 ends here

;; [[file:config.org::*Language Support][Language Support:2]]
(package! prettier-js)
;; Language Support:2 ends here

;; [[file:config.org::*AIs][AIs:1]]
(package! org-ai)
;; AIs:1 ends here

;; [[file:config.org::*Balderdash (Disabled) Packages][Balderdash (Disabled) Packages:1]]
(package! flycheck-popup-tip :disable t)
;; Balderdash (Disabled) Packages:1 ends here
