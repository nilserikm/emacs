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
;; (load-user-file "my-colors.el")
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
    ("be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" default)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
