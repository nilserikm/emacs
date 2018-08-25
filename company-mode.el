;; set default `company-backends'
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        ;; (company-abbrev company-dabbrev)
        ))

(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-anaconda)))
;; (dolist (hook '(js-mode-hook
;;                 js2-mode-hook
;;                 js3-mode-hook
;;                 inferior-js-mode-hook
;;                 ))
;;   (add-hook hook
;;             (lambda ()
;;               (tern-mode t)

;;               (add-to-list (make-local-variable 'company-backends)
;;                            'company-tern)
;;               )))

(add-hook 'php-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-php)))

;;;_. company-mode support like auto-complete in web-mode
;; Enable CSS completion between <style>...</style>
(defadvice company-css (before web-mode-set-up-ac-sources activate)
  "Set CSS completion based on current language before running `company-css'."
  (if (equal major-mode 'web-mode)
      (let ((web-mode-cur-language (web-mode-language-at-pos)))
        (if (string= web-mode-cur-language "css")
            (unless css-mode (css-mode))))))

;; Enable JavaScript completion between <script>...</script> etc.
(defadvice company-tern (before web-mode-set-up-ac-sources activate)
  "Set `tern-mode' based on current language before running `company-tern'."
  (if (equal major-mode 'web-mode)
      (let ((web-mode-cur-language (web-mode-language-at-pos)))
        (if (or (string= web-mode-cur-language "javascript")
		(string= web-mode-cur-language "jsx"))
            (unless tern-mode (tern-mode))
          (if tern-mode (tern-mode))
          ))))
