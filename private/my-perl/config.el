(setq cperl-electric-parens nil)

;; use cperl-mode
(add-to-list 'auto-mode-alist '(".+\\.p[lm]$" . cperl-mode))
(add-to-list 'auto-mode-alist '(".+\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '(".+\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '(".+\\.tx$" . web-mode))

;; indent
(custom-set-variables
 '(cperl-indent-level 4)
 '(cperl-continued-statement-offset 4)
 '(cperl-brace-offset -4)
 '(cperl-label-offset -4)
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset -4)
 '(cperl-tab-always-indent t)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-subs-specially nil)
 '(cperl-indent-region-fix-constructs nil))

;; always use cperl-mode instead of perl-mode
(defalias 'perl-mode 'cperl-mode)

