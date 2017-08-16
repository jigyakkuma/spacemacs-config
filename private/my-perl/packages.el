(defconst my-perl-packages
  '(
    (cperl-mode :location elpa)
    ))

(defun my-perl/init-cperl-mode ()
  (use-package cperl-mode
    :defer t
    :init
    (evil-leader/set-key-for-mode 'cperl-mode
      "fr" 'perltidy-region
      "fd" 'perltidy-defun
      "fb" 'perltidy-buffer)
    ))

;;; packages.el ends here
