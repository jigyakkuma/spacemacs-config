(setq my-perl-packages
      '(
        (cperl-mode :location elpa)
        flycheck
        ))

(defun my-perl/init-cperl-mode ()
  (use-package cperl-mode
    :defer t
    :init (dolist (mode '(cperl-mode))
            (spacemacs/declare-prefix "mf" "Perl/perltidy")
            (spacemacs/set-leader-keys-for-major-mode mode
              "fr" 'perltidy-region
              "fd" 'perltidy-defun
              "fb" 'perltidy-buffer))))

(defun my-perl/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'cperl-mode))
