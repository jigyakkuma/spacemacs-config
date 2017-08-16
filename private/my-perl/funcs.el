(defvar perltidy-configuration-file (format "%s/.perltidyrc" (getenv "HOME")))

(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) (format "perltidy -q -pro=%s" perltidy-configuration-file) nil t)))

(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
    (perltidy-region)))

(defun perltidy-buffer ()
  "Run perltidy on the current buffer."
  (interactive)
  (save-excursion (mark-whole-buffer)
    (perltidy-region)))
