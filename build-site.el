;; Setup Emacs package manager
(require 'package)
(setq package-user-dir (expand-file-name "./packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install Dependencies
(package-install 'htmlize)

;; Load org-mode publishing library
(require 'ox-publish)

;; Customize HTML
(setq org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\">"
      org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil)

(setq org-publish-project-alist
      (list
       (list "Marvin's Schreibstube"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publish-function 'org-publish-to-html


	     :with-author nil
	     :with-creator t
	     :section-numbers nil
	     :time-stamp-file nil
	     :with-toc t)))



(org-publish-all t)

(message "Build finished!")
