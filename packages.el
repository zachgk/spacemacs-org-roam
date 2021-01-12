(defconst org-roam-packages
  '(org-roam-bibtex
    org-noter
    (org-fc :location local)))

(defun org-roam/init-org-roam-bibtex ()
  (use-package org-roam-bibtex
    :after org-roam
    :hook
    (org-roam-mode . org-roam-bibtex-mode)
    :bind (:map org-mode-map
               (("C-c n a" . orb-note-actions)))
    :init
    (progn
      (require 'org-roam-bibtex)
      (add-hook 'after-init-hook #'org-roam-bibtex-mode)
      (setq org-ref-notes-function 'orb-edit-notes)
      (define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)
      )
    ))


(defun org-roam/init-org-fc ()
  (use-package org-fc
    :load-path "/data/projects/emacs/org-fc"
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

(defun org-roam/post-init-org-roam ()
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "rR" 'org-roam-random-note
    )
  (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "rR" 'org-roam-random-note
    )
  (spacemacs/declare-prefix-for-mode 'org-journal-mode "mr" "org-roam")
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "rb" 'org-roam-switch-to-buffer
    "rdy" 'org-roam-dailies-yesterday
    "rdt" 'org-roam-dailies-today
    "rdT" 'org-roam-dailies-tomorrow
    "rf" 'org-roam-find-file
    "rg" 'org-roam-graph
    "ri" 'org-roam-insert
    "rI" 'org-roam-insert-immediate
    "rl" 'org-roam))
