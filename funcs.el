(defun org-roam-random ()
  "Finds random org roam file"
  (interactive)
  (find-file (seq-random-elt (org-roam--list-all-files)))
  )
