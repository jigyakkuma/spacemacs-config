(defconst my-perl-packages
      '(
        (cperl-mode :location elpa)
        flycheck
        ))

(defun my-perl/init-cperl-mode ()
  (use-package cperl-mode
    :defer t
    :init
    (dolist
      (mode '(perl-mode cperl-mode))

      (spacemacs/declare-prefix "md" "Perl/perldoc")
      (spacemacs/set-leader-keys-for-major-mode mode
        "do" 'cperl-perldoc
        "da" 'cperl-perldoc-at-point)

      (spacemacs/declare-prefix "mf" "Perl/perltidy")
      (spacemacs/set-leader-keys-for-major-mode mode
        "fr" 'perltidy-region
        "fd" 'perltidy-defun
        "fb" 'perltidy-buffer)

      (add-hook 'smartparens-enabled-hook  (lambda () (define-key cperl-mode-map "{" nil)))
      (add-hook 'smartparens-disabled-hook  (lambda () (define-key cperl-mode-map "{" 'cperl-electric-lbrace))))))

;; (defun my-perl/init-flycheck ()
;;   (use-package flycheck
;;     :defer t
;;     :init
;;     (progn
;;       (flycheck-mode t)
;;       (setq flycheck-checker 'perl-project-libs)
;;       (flycheck-define-checker perl-project-libs
;;         "A perl syntax checker."
;;         :command ("perl"
;;                   "-MProject::Libs lib_dirs => [qw(local/lib/perl5)]"
;;                   "-wc"
;;                   source-inplace)
;;         :error-patterns ((error line-start
;;                                 (minimal-match (message))
;;                                 " at " (file-name) " line " line
;;                                 (or "." (and ", " (zero-or-more not-newline)))
;;                                 line-end))
;;         :modes (perl-mode cperl-mode)))))

(defun my-perl/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'perl-mode)
  (spacemacs/add-flycheck-hook 'cperl-mode))
