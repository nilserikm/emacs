(defun my-web-mode-hook ()
  "Simple hook for web mode."
  ;; (subword-mode 1)
  (smartparens-mode)
  ;; (show-paren-mode)

  (add-to-list 'company-dabbrev-code-modes 'web-mode)

  (message "My WEB mode hook"))
;; end my-web-mode-hook
