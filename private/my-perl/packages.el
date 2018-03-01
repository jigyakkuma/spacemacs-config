(defconst my-perl-packages
      '(
        (cperl-mode :location built-in)
        flycheck
        (flycheck-my-perl :requires flycheck
                          :location local)
        ))

(defun my-perl/init-cperl-mode ()
  (use-package cperl-mode
    :mode "\\.\\(p[lm]x?\\|P[LM]X?\\|t\\|tx\\)\\'"
    :interpreter "perl"
    :interpreter "perl5"

    :init
    (progn
      (setq
       ;; highlight all scalar variables not just the instantiation
       cperl-highlight-variables-indiscriminately t
       cperl-indent-level 4        ; 4 spaces is the standard indentation
       cperl-close-paren-offset -4 ; indent the closing paren back four spaces
       cperl-continued-statement-offset 4 ; if a statement continues indent it to four spaces
       cperl-indent-parens-as-block t)) ; parentheses are indented with the block and not with scope

    ))

(defun my-perl/init-flycheck-my-perl ()
  (use-package flycheck-my-perl
    :init
    (progn
      (flycheck-define-checker perl-project-libs
        "A perl syntax checker."
        :command ("perl"
                  "-MProject::Libs lib_dirs => [qw(local/lib/perl5 t)]"
                  "-wc"
                  source-inplace)
        :standard-input t
        :error-patterns ((error line-start
                                (minimal-match (message))
                                " at " (file-name) " line " line
                                (or "." (and ", " (zero-or-more not-newline)))
                                line-end))
        :modes (cperl-mode)
        :next-checkers (perl-perlcritic)))
    (add-to-list 'flycheck-checkers 'perl-project-libs)
    ))

(defun my-perl/post-init-flycheck ()
  (spacemacs/enable-flycheck 'cperl-mode)
  )

(defun my-perl/post-init-smartparens ()
  (with-eval-after-load 'cperl-mode
    (add-hook 'smartparens-enabled-hook
              #'spacemacs//perl5-smartparens-enable)
    (add-hook 'smartparens-disabled-hook
              #'spacemacs//perl5-spartparens-disable)))

