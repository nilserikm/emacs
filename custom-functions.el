;; make emacs retain fat cursor on empty lines/spaces as well
(defun cursor-shape-hook ()
    (if (equal (thing-at-point 'line) "\n") (setq cursor-type 'block)
       (setq cursor-type 'box)))

(add-hook 'post-command-hook 'cursor-shape-hook)

;; make C-a go to beginning of line first
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; smarter open-line which handles indentation on newline
(defun open-line-and-indent ()
  "Like `newline-and-indent', but do not move the point."
  (interactive)
  (save-excursion
    (newline-and-indent))
  (indent-according-to-mode))
