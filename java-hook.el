(defun my-java-mode-hook ()
  "Simple hook for java mode."
  (dumb-jump-mode 1)
  (smartparens-mode)
  (message "My JAVA mode hook"))

(add-hook 'java-mode-hook 'my-java-mode-hook)
;; end my-java-mode-hook
