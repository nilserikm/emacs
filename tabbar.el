;; Tabbar
(require 'tabbar)
;; tabbar settings light-theme
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "white"
;;  :foreground "white"
;;  :box '(:line-width 1 :color "white" :style nil))

;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "LavenderBlush2"
;;  :foreground "black"
;;  :box '(:line-width 5 :color "LavenderBlush2" :style nil))

;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "light steel blue"
;;  :foreground "white"
;;  :box '(:line-width 5 :color "light steel blue" :style nil))

;; (set-face-attribute
;;  'tabbar-highlight nil
;;   :background "white"
;;  :foreground "black"
;;  :underline nil
;;  :box '(:line-width 5 :color "white" :style nil))

;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "gray20" :style nil))

;; (set-face-attribute
;;  'tabbar-separator nil
;;   :background "white"
;;  :height 0.6)

;; tabbar-settings for nord-theme
 (set-face-attribute
 'tabbar-default nil
  :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))

 

(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))

(set-face-attribute
 'tabbar-highlight nil
  :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; SECTION BEGIN : TABBAR CONFIGURATION ;;
;; customize to show all normal files in one group
(defun my-tabbar-buffer-groups ()
  "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus
 dired buffers), and the rest.  This works at least with Emacs v24.2 using
 tabbar.el v1.7."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))

;; buffer modification state indicator
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
    (if (and (buffer-modified-p (tabbar-tab-value tab))
         (buffer-file-name (tabbar-tab-value tab)))
        (concat " + " (concat ad-return-value " "))
      (concat " " (concat ad-return-value " ")))))

(defun ztl-modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(defun ztl-on-buffer-modification ()
  (set-buffer-modified-p t)
  (ztl-modification-state-change))

(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)

(tabbar-mode 1)
