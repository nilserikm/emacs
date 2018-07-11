(defun my-php-mode-hook ()
  "Simple hook for php mode."
  (subword-mode 1)
  (dumb-jump-mode 1)
  (smartparens-mode)
  (show-paren-mode)
  (ac-php-core-eldoc-setup)
  
  ;; (make-local-variable 'company-backends)
  (make-local-variable 'company-backends)
  (fci-mode 1)

  (add-to-list 'company-backends 'company-ac-php-backend)
  ;; (add-to-list 'company-dabbrev-code-modes 'php-mode) ; this line gives an error

  (message "My PHP mode hook"))

(add-hook 'php-mode-hook 'my-php-mode-hook)
(add-hook 'php-mode-hook 'my-progging-hook)

