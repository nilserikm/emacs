(require 'airline-themes)
(load-theme 'airline-papercolor t)

;; general theme-settings
(set-default 'cursor-type 'box)
(set-face-attribute 'blink-cursor-blinks 0)
(set-face-attribute 'default nil :height 100)

;; theme-settings for light
;; (load-theme 'adwaita t)
;; (custom-set-faces
;;  '(region ((t (:background "darkseagreen3"))))
;;  )

;; theme-settings for nord
(load-theme 'nord t)
(custom-set-faces
 '(web-mode-comment-face ((t (:foreground "rosy brown"))))
 '(font-lock-doc-face ((t (:foreground "rosy brown"))))
 '(font-lock-comment-face ((t (:foreground "rosy brown"))))
 '(region ((t (:background "light steel blue" :foreground "black"))))
 '(lazy-highlight ((t (:background "light steel blue" :foreground "black"))))
 '(git-commit-overlong-summary ((t (:background "rosy brown"))))
 )
