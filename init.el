;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/") t)

(require 'company)
(require 'dumb-jump)
(require 'expand-region)
(require 'fill-column-indicator)
(require 'flycheck)
(require 'helm)
(require 'helm-projectile)
(require 'js2-mode)
(require 'neotree)
(require 'php-mode)
(require 'popup) ; use popup menu for yas-choose-value
(require 'projectile)
(require 'tabbar)
(require 'yasnippet)
(require 'tramp) 

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "general-settings.el")
(load-user-file "keys.el")
(load-user-file "color-theme.el")
(load-user-file "tabbar.el")
(load-user-file "neotree.el")
(load-user-file "custom-functions.el")
(load-user-file "projectile.el")
(load-user-file "company-mode.el")
(load-user-file "flycheck.el")
(load-user-file "yasnippet.el")
(load-user-file "programming-hook.el")
(load-user-file "php-hook.el")
(load-user-file "js2-hook.el")
(load-user-file "java-hook.el")
(load-user-file "web-hook.el")
(load-user-file "nlinum-hook.el")

;; SECTION : MODES LIST
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(projectile-mode t)
(helm-mode t)

;; left-over comments in regards to loading themes/neotree after/in conjunction with emacs as daemon
;;(if (daemonp)
;;    (add-hook 'after-make-frame-functions
;;        (lambda (frame)
;;            (with-selected-frame frame
;;          (load-theme 'nord t)
;;          (load-theme 'airline-papercolor t)
;;          neo-theme (if (display-graphic-p) 'icons 'arrow)
;;          )))
;;  (load-theme 'nord t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("40da996f3246a3e99a2dff2c6b78e65307382f23db161b8316a5440b037eb72c" default)))
 '(package-selected-packages
   (quote
    (xref-js2 web-mode w3 smartparens nord-theme neotree magit js2-refactor highlight-symbol helm-projectile flycheck fill-column-indicator expand-region dumb-jump company-tern company-quickhelp company-php all-the-icons airline-themes)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 160 :width normal))))
 '(font-lock-comment-face ((t (:foreground "rosy brown"))))
 '(font-lock-doc-face ((t (:foreground "rosy brown"))))
 '(js2-jsdoc-value ((t (:foreground "light coral"))))
 '(linum ((t (:background "steel blue" :foreground "white smoke"))))
 '(region ((t (:background "rosy brown"))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "gray75" :box (:line-width 1 :color "gray20")))))
 '(tabbar-button-highlight ((t (:foreground "gray75"))))
 '(web-mode-comment-face ((t (:foreground "rosy brown")))))
