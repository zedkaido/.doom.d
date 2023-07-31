;;; zk-white-theme.el --- -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Zed Kaido <https://github.com/zedkaido>
;; Source: https://github.com/zedkaido/doom.d/themes/zk-white-theme.el
;;
;;; Commentary:
;;  - Minimalistic.
;;  - Clean.
;;  - Readable.
;;  - Effective.
;;
;;; Code:

(require 'doom-themes)

(def-doom-theme zk-white
  "the definition of beauty and simplicity"

  ;; name        default   256       16
  (
   (bg         '("#F3F3F3" "F3F3F3"  "white"        ))
   (bg-alt     '("#F5F5F5" "F5F5F5"  "white"        ))
   (base0      '("#F1F1F1" "black"   "black"        ))
   (base1      '("#EEEEEE" "#EEEEEE" "brightblack"  ))
   (base2      '("#F1F1F1" "#F1F1F1" "brightblack"  ))
   (base3      '("#DFDFDF" "#DFDFDF" "brightblack"  ))
   (base4      '("#DCDCDC" "#DCDCDC" "brightblack"  ))
   (base5      '("#D6D6D6" "#D6D6D6" "brightblack"  ))
   (base6      '("#92A2AF" "#92A2AF" "brightblack"  ))
   (base7      '("#788484" "#788484" "brightblack"  ))
   (base8      '("#626C6C" "#626C6C" "black"        ))
   (fg         '("#556b72" "#556b72" "black"        ))
   (fg-alt     '("#7D9298" "#7D9298" "brightblack"  ))

   (grey       base4)
   (red        '("#dc322f" "#dc322f" "red"          ))
   (orange     '("#556b72" "#ff6655" "black"        ))
   (green      '("#556b72" "#556b72" "black"        ))
   (teal       '("#556b72" "#556b72" "black"        ))
   (yellow     '("#556b72" "#556b72" "black"        ))
   (blue       '("#556b72" "#556b72" "black"        ))
   (dark-blue  '("#556b72" "#556b72" "black"        ))
   (magenta    '("#556b72" "#556b72" "black"        ))
   (violet     '("#556b72" "#556b72" "black"        ))
   (cyan       '("#556b72" "#556b72" "black"        ))
   (dark-cyan  '("#556b72" "#556b72" "black"        ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base4)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       base6)
   (doc-comments   teal)
   (constants      violet)
   (functions      magenta)
   (keywords       green)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        cyan)
   (variables      blue)
   (numbers        violet)
   (region         `(,(doom-darken (car bg-alt) 0.05) ,@(doom-darken (cdr base0) 0.06)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden `(,(car base1)))
   )

  ;; --- Extra Faces Options ------------------------
  (
   (cursor :background fg)

   (lazy-highlight :background base3
		   :foreground fg)

   (speed-type-correct :foreground base6)

   (evil-snipe-first-match-face :foreground fg)

   (company-tooltip-selection :background base0)
   (company-template-field :background "#000000")

   (lsp-ui-peek-highlight :background bg-alt :foreground fg)
   (lsp-ui-peek-header :background fg-alt :foreground bg)

   (elscreen-tab-other-screen-face :background "#353a42"
				   :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (helm-selection :inherit 'bold
		   :background selection
		   :distant-foreground bg
		   :extend t)

   (font-lock-comment-face :foreground comments)
   (font-lock-doc-face :inherit 'font-lock-comment-face :foreground doc-comments)
   (font-lock-keyword-face :weight 'bold :foreground keywords)
   (font-lock-constant-face :weight 'bold :foreground constants)

   ;; Tooltip
   (tooltip :background base4
	    :foreground fg)

   ;; Indent Guide
   (indent-guide-face :foreground "#DCDCDC")

   ;; --- major-mode faces -------------------

   ;; all-the-icons
   (all-the-icons-dblue :foreground blue)

   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property :foreground teal)
   (css-selector :foreground blue)

   ;; dired
   (diredfl-dir-name :weight 'semi-bold)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face :foreground base6 :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override) :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; org-mode
   ((org-block &override) :background bg-alt)
   ((org-block-begin-line &override) :foreground comments :background base2)
   (org-hide :foreground hidden)
   (org-quote :background bg-alt)

   (org-drawer :foreground base8 :weight 'semi-bold)
   (org-document-info-keyword :foreground base6)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground teal)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground blue)
   ((outline-7 &override) :foreground blue)
   ((outline-8 &override) :foreground blue)

   )
  )

;;; zk-white-theme.el ends here
