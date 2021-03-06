(defun spacemacs//perl5-smartparens-enable ()
  (define-key cperl-mode-map "{" nil))

(defun spacemacs//perl5-spartparens-disable ()
  (define-key cperl-mode-map "{" 'cperl-electric-lbrace))

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
