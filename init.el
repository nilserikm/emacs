;;; package --- Summary:
;;; Commentary:
;;; Code:

; list the packages you want
(setq package-list '(
		     all-the-icons
		     company
		     company-php
		     dumb-jump
		     expand-region
		     fill-column-indicator
		     flycheck
		     helm
		     helm-projectile
		     js2-mode
		     neotree
		     php-mode
		     popup
		     projectile
		     ;; tabbar
		     tramp
		     yasnippet
		     ))

(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (package-initialize)

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'color-theme)
(require 'company)
(require 'company-php)
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
(require 'tramp)
(require 'yasnippet)

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
 (load-user-file "my-colors.el")
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

;; make load-theme unload/disable current first
(defadvice load-theme (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))

;; function to unload current theme before enabling new theme
(defun enab-theme (theme) 
 (if current-t43m3 (disable-theme current-t43m3))
 (setq current-t43m3 theme) 
 (load-theme theme t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(package-selected-packages
   (quote
    (nord-theme js2-refactor highlight-symbol web-mode airline-themes yasnippet smartparens paper-theme neotree multiple-cursors magit js2-mode helm-projectile flycheck fill-column-indicator expand-region dumb-jump company-tern company-quickhelp company-php color-theme-sanityinc-tomorrow color-theme-github all-the-icons)))
 '(show-paren-mode t)
 '(tabbar-separator (quote (0.5)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 159 :width normal))))
 '(font-lock-comment-face ((t (:foreground "rosy brown"))))
 '(font-lock-doc-face ((t (:foreground "rosy brown"))))
 '(git-commit-overlong-summary ((t (:background "rosy brown"))))
 '(lazy-highlight ((t (:background "light steel blue" :foreground "black"))))
 '(region ((t (:background "light steel blue" :foreground "black"))))
 '(neo-dir-link-face ((t (:slant normal :weight bold :height 140 :family "Ubuntu Mono"))))
 '(neo-file-link-face ((t (:weight normal :height 140 :family "Ubuntu Mono"))))
 '(web-mode-comment-face ((t (:foreground "rosy brown")))))
