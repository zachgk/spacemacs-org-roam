(defconst org-roam-packages
  '(org-roam
    org-roam-bibtex
    (company-org-roam :location (recipe :fetcher github :repo "org-roam/company-org-roam"))
    org-noter
    (org-fc :location local)))

(defun org-roam/init-org-roam ()
  (use-package org-roam
    :hook
    (after-init . org-roam-mode)
    :init
    (progn
      (setq org-roam-title-include-subdirs t)
      (spacemacs/declare-prefix "ar" "org-roam")
      (spacemacs/set-leader-keys
       "arl" 'org-roam
       "art" 'org-roam-dailies-today
       "arf" 'org-roam-find-file
       "arg" 'org-roam-graph)

      (spacemacs/declare-prefix-for-mode 'org-journal-mode "mr" "org-roam")
      (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
                                                "rl" 'org-roam
                                                "rt" 'org-roam-dailies-today
                                                "rb" 'org-roam-switch-to-buffer
                                                "rf" 'org-roam-find-file
                                                "ri" 'org-roam-insert
                                                "rg" 'org-roam-graph)
      (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
                                                "rl" 'org-roam
                                                "rt" 'org-roam-dailies-today
                                                "rb" 'org-roam-switch-to-buffer
                                                "rf" 'org-roam-find-file
                                                "ri" 'org-roam-insert
                                                "rg" 'org-roam-graph)))
  )

(defun org-roam/init-org-roam-bibtex ()
  (use-package org-roam-bibtex
    :hook
    (org-roam-mode . org-roam-bibtex-mode)))

(defun org-roam/init-company-org-roam ()
  (use-package company-org-roam
    :init
    (progn
      (spacemacs|add-company-backends :backends 'company-org-roam :modes org-mode)
      )))


(defun org-roam/init-org-fc ()
  (use-package org-fc
    :config
    (require 'org-fc-hydra)
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'org-mode "mrc" "flashcards")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "rcm" 'org-fc-dashboard
        "rcr" 'org-fc-review-all
        "rcu" 'org-fc-update
        "rci" 'org-fc-hydra-type/body)
    )
  ))

(defun org-roam/init-org-noter ()
  (use-package org-noter
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "n" 'org-noter
    ))))

(defun org-roam/post-init-org ()
  (setq org-modules (quote (org-protocol)))
  (require 'org-protocol))

(defun org-roam/post-init-org-roam ()
  (setq org-modules (quote (org-roam-protocol)))
  (require 'org-roam-protocol))
