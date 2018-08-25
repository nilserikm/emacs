;;; package --- Summary:
;;; Commentary:
;;; Code:
(defun my-js2-mode-hook ()
  "Simple js2-mode hook."

  (defvar js-indent-level)
  (defvar js2-auto-indent-p)
  (defvar js2-cleanup-whitespace)
  (defvar js2-enter-indents-newline)
  (defvar js2-indent-on-enter-key)
  (defvar js2-mode-indent-ignore-first-tab)
  (defvar tern-mode-keymap)
  (defvar js-mode-map)
  (defvar company-backends)
  
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode)))
  
  ;; keybindings
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))

  (setq js-indent-level 4
    js2-auto-indent-p t
    js2-cleanup-whitespace t
    js2-enter-indents-newline t
    js2-indent-on-enter-key t
    js2-highlight-vars-mode t ; js2-highlight-vars does not yet work with export default {}
    js2-mode-indent-ignore-first-tab t)

  ;; Disable tern-mode completion keybindings,
  ;; as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)

  ;; js-mode (which js2 is based on) binds "M-."
  ;; which conflicts with xref, so unbind it.
  (define-key js-mode-map (kbd "M-.") nil)

  (company-mode)
  (tern-mode)
  (smartparens-mode)
  (fci-mode 1)
  (js2-imenu-extras-mode)
  (highlight-symbol-mode)
  (js2-refactor-mode)
  (yas-global-mode)

  (message "My JS2 mode hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(add-hook 'js2-mode-hook 'my-progging-hook)
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)

(provide 'js2-hook)
;;; js2-hook.el ends here
