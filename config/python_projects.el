; set virtualenv locations
(setq venv-location '("~/myenv/"
		      "~/pytesmo_development/"
		      "~/swi_dev/")
)
;; set pytesmo development environment
(defun pytesmo_env ()
  (interactive)
  (venv-workon "pytesmo_development")
  (setenv "PYTHONPATH" "/media/sf_H/Development/python/pytesmo")
)
(defun geo_env ()
  (interactive)
  (venv-workon "myenv")
  (setenv "PYTHONPATH" "/media/sf_H/Development/python/workspace/GEO_Python")
  (setq default-directory "/media/sf_H/Development/python/workspace/GEO_Python")
)
(defue swi_env ()
  (interactive)
  (venv-workon "swi_dev")
  (setenv "PYTHONPATH" "/media/sf_H/Development/python/workspace/SWI_NRT")
)
(provide 'python_projects)
