(defun my-js2-mode-hook ()
  "Simple js2-mode hook."
  (dolist (hook '(js-mode-hook
                js2-mode-hook
                js3-mode-hook
                inferior-js-mode-hook
                ))
  (add-hook hook
            (lambda ()
              (tern-mode t)

              (add-to-list (make-local-variable 'company-backends)
                           'company-tern)
              )))

  ;; keybindings
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))

  (setq js-indent-level 4
    js2-auto-indent-p t
    js2-cleanup-whitespace t
    js2-enter-indents-newline t
    js2-indent-on-enter-key t
    ;; js2-highlight-vars does not yet work with export default {}
    ;; js2-highlight-vars-mode t
    js2-mode-indent-ignore-first-tab t)

  ;; (imenu-after-jump-hook 'imenu-list-quit-window)
  ;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

  ;; Disable tern-mode completion keybindings,
  ;; as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)

  ;; js-mode (which js2 is based on) binds "M-."
  ;; which conflicts with xref, so unbind it.
  (define-key js-mode-map (kbd "M-.") nil)

  (tern-mode)
  (company-mode)
  (smartparens-mode)
  (show-paren-mode)
  (fci-mode 1)
  ;; (js2-imenu-extras-mode)
  ;; (highlight-symbol-mode)
  ;; (if (featurep 'js2-highlight-vars)
  ;;     (js2-highlight-vars-mode))

  (add-to-list 'company-dabbrev-code-modes 'js2-mode)

  (message "My JS2 mode hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
