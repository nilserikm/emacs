(setq inhibit-startup-screen t ; prevent startup screen
      tramp-default-method "ssh" ;set tramp default method ssh over scp
      redisplay-dont-pause nil ; fix for large files being slow
      confirm-kill-emacs 'y-or-n-p ; confirm before quit
      frame-title-format '("%m") ; set filename as frame title
      )
				       

(menu-bar-mode -1) ; disable menu-bar on startup
(tool-bar-mode -1) ; disable tool-bar on startup
(scroll-bar-mode -1) ; toggle off scroll bar
(delete-selection-mode 1) ; replace active region by typing
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; start fullscreen

