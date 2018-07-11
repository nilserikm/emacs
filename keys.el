(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-7") 'helm-imenu)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-o") #'open-line-and-indent)
(global-set-key (kbd "C-x M-1") 'neotree-toggle)
(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-M-SPC") 'company-manual-begin)
(global-set-key (kbd "C-M-w") 'er/expand-region)
(global-set-key (kbd "M-W") 'er/contract-region)
(global-set-key (kbd "C-x M-/") 'comment-region)
(global-set-key (kbd "C-x M-7") 'uncomment-region)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-p") 'tabbar-backward-tab)
(global-set-key (kbd "C-x p") 'tabbar-backward-tab)
(global-set-key [C-tab] 'tabbar-forward-tab)
(global-set-key (kbd "C-x C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-x n") 'tabbar-forward-tab)
(global-set-key [C-iso-lefttab] 'tabbar-backward-tab)
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
(global-set-key (kbd "C-M-p") 'dumb-jump-back)
(global-set-key (kbd "M-/") 'helm-occur)
(global-set-key (kbd "C-x M-e") 'eww)

;; move to next and previous highlighted symbol
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-h") 'highlight-symbol-at-point)
(global-set-key (kbd "M-H") 'highlight-symbol-remove-all)

;; When you have an active region that spans multiple lines, the following will add a cursor to each line
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-S-<mouse-1>") 'mc/add-cursor-on-click)

;; keybindings for company-mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-i") #'company-quickhelp-manual-begin)
  (define-key company-active-map (kbd "C-I") #'company-quickhelp-manual-begin)
  (define-key company-active-map (kbd "<space>") nil)
  (define-key company-active-map (kbd "SPC") nil)
  (define-key company-active-map (kbd "<tab>") nil)
  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-n") 'company-select-next))

;; maybe i dont need this since this is supported in other modes
(global-set-key (kbd "M-.") 'js2r-rename-var)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
