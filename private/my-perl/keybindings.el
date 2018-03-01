(spacemacs/declare-prefix "mh" "Perl/perldoc")
(spacemacs/declare-prefix "mf" "Perl/perltidy")
(spacemacs/declare-prefix "mp" "Perl/plsense")
(spacemacs/set-leader-keys-for-major-mode 'cperl-mode
  "hd" 'cperl-perldoc
  "hh" 'cperl-perldoc-at-point
  "fr" 'perltidy-region
  "fd" 'perltidy-defun
  "fb" 'perltidy-buffer
  "ps" 'company-plsense-server-status
  "pu" 'company-plsense-start-server
  "pd" 'company-plsense-stop-server)
