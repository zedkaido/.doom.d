;;;; themes/eb-dark-theme.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;;
(defgroup eb-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom eb-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-comment-bg eb-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'eb-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme eb-dark "A dark theme inspired by VS Code Solarized Dark"
  ;; name        default   256       16
  ((bg         '("#002b36" "#002b36"       nil     ))
   (bg-alt     '("#00212B" "#00212B"       nil     ))
   (base0      '("#073642" "#073642"   "black"     ))
   ;; (base1      '("#03282F" "#03282F" "brightblack" ))
   (base1      '("#00222f" "#00222f" "brightblack" ))
   (base2      '("#00212C" "#00212C" "brightblack" ))
   (base3      '("#13383C" "#13383C" "brightblack" ))
   (base4      '("#56697A" "#56697A" "brightblack" ))
   (base5      '("#405A61" "#405A61" "brightblack" ))
   (base6      '("#96A7A9" "#96A7A9" "brightblack" ))
   (base7      '("#788484" "#788484" "brightblack" ))
   (base8      '("#626C6C" "#626C6C" "white"       ))
   (fg-alt     '("#657b83" "#657b83" "white"       ))
   (fg         '("#839496" "#839496" "brightwhite"))

   (grey       base4)
   (red        '("#923341" "#923341" "red"          ))
   (orange     '("#657b83" "#657b83" "brightred"    ))
   (green      '("#657b83" "#657b83" "green"        ))
   (teal       '("#657b83" "#657b83" "brightgreen"  ))
   ;; (yellow     '("#A19770" "#A19770" "yellow"       ))
   (yellow       '("#657b83" "#657b83" "brightblue"   ))
   (blue       '("#657b83" "#657b83" "brightblue"   ))
   (dark-blue  '("#657b83" "#657b83" "blue"         ))
   (magenta    '("#657b83" "#657b83" "magenta"      ))
   (violet     '("#657b83" "#657b83" "brightmagenta"))
   (cyan       '("#657b83" "#657b83" "brightcyan"   ))
   (dark-cyan  '("#657b83" "#657b83" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if eb-dark-brighter-comments blue base5))
   (doc-comments   teal)
   (constants      magenta)
   (functions      blue)
   (keywords       fg)
   (methods        cyan)
   (operators      orange)
   (type           fg)
   (strings        cyan)
   (variables      fg)
   (numbers        magenta)
   (region         base0)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright eb-dark-brighter-modeline)
   (-modeline-pad (when eb-dark-padded-modeline
                    (if (integerp eb-dark-padded-modeline)
                        eb-dark-padded-modeline
                      4)))
   (modeline-fg     nil)
   (modeline-fg-alt base5)
   (modeline-bg (if -modeline-bright base3 `(,(doom-darken (car bg) 0.15)
                                             ,@(cdr base0))))
   (modeline-bg-l (if -modeline-bright base3 `(,(doom-darken (car bg) 0.1)
                                               ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg)
                             ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((company-tooltip-selection     :background dark-cyan)
   (elscreen-tab-other-screen-face :background "#353a42"
                                   :foreground "#1e2022")
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)
   (font-lock-comment-face :foreground comments
                           :background (if eb-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face :inherit 'font-lock-comment-face
                       :foreground doc-comments)
   (font-lock-keyword-face :weight 'bold
                           :foreground keywords)
   (font-lock-constant-face :weight 'bold
                            :foreground constants)

   ;; Centaur tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected
                                          :foreground blue)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected
                                            :foreground blue)
   ;; Doom modeline
   (doom-modeline-bar :background blue)
   (mode-line :background modeline-bg
              :foreground modeline-fg
              :box (if -modeline-pad
                       `(:line-width ,-modeline-pad
                         :color ,modeline-bg)))
   (mode-line-inactive :background modeline-bg-inactive
                       :foreground modeline-fg-alt
                       :box (if -modeline-pad
                                `(:line-width ,-modeline-pad
                                  :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   (solaire-mode-line-face :inherit 'mode-line
                           :background modeline-bg-l
                           :box (if -modeline-pad
                                    `(:line-width ,-modeline-pad
                                      :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face :inherit 'mode-line-inactive
                                    :background modeline-bg-inactive-l
                                    :box (if -modeline-pad
                                             `(:line-width ,-modeline-pad
                                               :color ,modeline-bg-inactive-l)))
   (tooltip              :background bg-alt
                         :foreground fg)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold
                         :foreground red)
   (markdown-url-face    :foreground teal
                         :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground teal)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground blue)
   ((outline-7 &override) :foreground blue)
   ((outline-8 &override) :foreground blue)

   ;; org-mode
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground comments :background base1)
   (org-hide :foreground hidden)
   (org-quote :background base1)
   (solaire-org-hide-face :foreground hidden))

  ;; --- extra variables ---------------------
  ;; ()
  )
;;; eb-dark-theme.el ends here;;; themes/eb-dark-theme.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;;
(defgroup eb-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom eb-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-comment-bg eb-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'eb-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme eb-dark "A dark theme inspired by VS Code Solarized Dark"
  ;; name        default   256       16
  ((bg         '("#002b36" "#002b36"       nil     ))
   (bg-alt     '("#00212B" "#00212B"       nil     ))
   (base0      '("#073642" "#073642"   "black"     ))
   ;; (base1      '("#03282F" "#03282F" "brightblack" ))
   (base1      '("#00222f" "#00222f" "brightblack" ))
   (base2      '("#00212C" "#00212C" "brightblack" ))
   (base3      '("#13383C" "#13383C" "brightblack" ))
   (base4      '("#56697A" "#56697A" "brightblack" ))
   (base5      '("#405A61" "#405A61" "brightblack" ))
   (base6      '("#96A7A9" "#96A7A9" "brightblack" ))
   (base7      '("#788484" "#788484" "brightblack" ))
   (base8      '("#626C6C" "#626C6C" "white"       ))
   (fg-alt     '("#657b83" "#657b83" "white"       ))
   (fg         '("#839496" "#839496" "brightwhite"))

   (grey       base4)
   (red        '("#923341" "#923341" "red"          ))
   (orange     '("#657b83" "#657b83" "brightred"    ))
   (green      '("#657b83" "#657b83" "green"        ))
   (teal       '("#657b83" "#657b83" "brightgreen"  ))
   ;; (yellow     '("#A19770" "#A19770" "yellow"       ))
   (yellow       '("#657b83" "#657b83" "brightblue"   ))
   (blue       '("#657b83" "#657b83" "brightblue"   ))
   (dark-blue  '("#657b83" "#657b83" "blue"         ))
   (magenta    '("#657b83" "#657b83" "magenta"      ))
   (violet     '("#657b83" "#657b83" "brightmagenta"))
   (cyan       '("#657b83" "#657b83" "brightcyan"   ))
   (dark-cyan  '("#657b83" "#657b83" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if eb-dark-brighter-comments blue base5))
   (doc-comments   teal)
   (constants      magenta)
   (functions      blue)
   (keywords       fg)
   (methods        cyan)
   (operators      orange)
   (type           fg)
   (strings        cyan)
   (variables      fg)
   (numbers        magenta)
   (region         base0)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright eb-dark-brighter-modeline)
   (-modeline-pad (when eb-dark-padded-modeline
                    (if (integerp eb-dark-padded-modeline)
                        eb-dark-padded-modeline
                      4)))
   (modeline-fg     nil)
   (modeline-fg-alt base5)
   (modeline-bg (if -modeline-bright base3 `(,(doom-darken (car bg) 0.15)
                                             ,@(cdr base0))))
   (modeline-bg-l (if -modeline-bright base3 `(,(doom-darken (car bg) 0.1)
                                               ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg)
                             ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((company-tooltip-selection     :background dark-cyan)
   (elscreen-tab-other-screen-face :background "#353a42"
                                   :foreground "#1e2022")
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)
   (font-lock-comment-face :foreground comments
                           :background (if eb-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face :inherit 'font-lock-comment-face
                       :foreground doc-comments)
   (font-lock-keyword-face :weight 'bold
                           :foreground keywords)
   (font-lock-constant-face :weight 'bold
                            :foreground constants)

   ;; Centaur tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected
                                          :foreground blue)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected
                                            :foreground blue)
   ;; Doom modeline
   (doom-modeline-bar :background blue)
   (mode-line :background modeline-bg
              :foreground modeline-fg
              :box (if -modeline-pad
                       `(:line-width ,-modeline-pad
                         :color ,modeline-bg)))
   (mode-line-inactive :background modeline-bg-inactive
                       :foreground modeline-fg-alt
                       :box (if -modeline-pad
                                `(:line-width ,-modeline-pad
                                  :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   (solaire-mode-line-face :inherit 'mode-line
                           :background modeline-bg-l
                           :box (if -modeline-pad
                                    `(:line-width ,-modeline-pad
                                      :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face :inherit 'mode-line-inactive
                                    :background modeline-bg-inactive-l
                                    :box (if -modeline-pad
                                             `(:line-width ,-modeline-pad
                                               :color ,modeline-bg-inactive-l)))
   (tooltip              :background bg-alt
                         :foreground fg)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold
                         :foreground red)
   (markdown-url-face    :foreground teal
                         :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground teal)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground blue)
   ((outline-7 &override) :foreground blue)
   ((outline-8 &override) :foreground blue)

   ;; org-mode
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground comments :background base1)
   (org-hide :foreground hidden)
   (org-quote :background base1)
   (solaire-org-hide-face :foreground hidden))

  ;; --- extra variables ---------------------
  ;; ()
  )
;;; eb-dark-theme.el ends here;; themes/zk-dark.el -*- lexical-binding: t; -*-
