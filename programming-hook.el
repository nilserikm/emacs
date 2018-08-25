(defun my-progging-hook ()
  "A general programming hook for all modes."
  (setq c-basic-offset 4
         auto-window-vscroll nil
         ;; company-auto-complete t
         company-auto-complete 'company-explicit-action-p
         company-global-modes t
         company-idle-delay 0.3
         company-minimum-prefix-length 3
         company-quickhelp-delay nil
         company-show-numbers t
         company-tooltip-limit 10
         custom-safe-themes t
         ido-enable-flex-matching t
         ido-everywhere t
         imenu-use-popup-menu t
         imenu-auto-rescan t
         imenu-list-focus-after-activation t
         imenu-list-auto-resize t
         imenu-list-after-jump-hook nil
         indent-tabs-mode nil
	 

	 ;; set fill-column-indicator stuff
         fci-rule-column 80
         fci-rule-width 1
         fci-rule-color "slategray"
         fci-rule-use-dashes 0.27

	 tabbar-buffer-groups-function 'my-tabbar-buffer-groups
         tabbar-use-images nil         
	 )  

  ;; start projectile mode
  ;; (projectile-global-mode t)
  ;; (helm-projectile-on)
  
  (global-hl-line-mode 1) ; highlight current line
  
  (company-quickhelp-mode t)
  (global-company-mode)
  (yas-global-mode 1)
  (tabbar-mode t)
  (add-hook 'imenu-list-after-jump-hook #'imenu-list-quit-window)

  (define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode) ; fill-column-indicator minor mode custom

  (message "Progging ..."))
;; (add-to-list 'default-frame-alist '(background-color . "#303e4d"))
