;; enable caching
(setq projectile-enable-caching t)

;; set cache expire
(setq projectile-file-exists-local-cache-expire (* 5 60))

;; stuff to make projectile create file if not found
(with-eval-after-load 'helm-projectile
  (defvar helm-source-file-not-found
    (helm-build-dummy-source
     "Create file"
     :action (lambda (cand) (find-file cand))))

  (add-to-list 'helm-projectile-sources-list helm-source-file-not-found t))
