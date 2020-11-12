;;; plugins/+xetex.el -*- lexical-binding: t; -*-

;; TeX-mode settings
(setq-default TeX-engine 'xetex)

;; Org-mode settings
(after! org
        (setq org-preview-latex-default-process 'xdvisvgm)
        (add-to-list 'org-preview-latex-process-alist '(xdvisvgm
                                                        :programs ("xelatex" "dvisvgm")
                                                        :description "xdv > svg"
                                                        :message "you need to install the programs: xelatex and dvisvgm."
                                                        :image-input-type "xdv"
                                                        :image-output-type "svg"
                                                        :image-size-adjust (1.7 . 1.5)
                                                        :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                                                        :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))))
(after! ox-latex
        (setq
         org-latex-compiler "xelatex"
         org-latex-pdf-process (mapcar (lambda (s) (replace-regexp-in-string "%latex" "xelatex" s)) org-latex-pdf-process)) ; ensures proper compilation
        (add-to-list 'org-latex-packages-alist '("pass" "geometry")) ; this prevents buggy page resizes in XeTeX
        (dolist (pkg '("fontspec"
                       "xpatch"
                       "letltxmacro"
                       "fullpage"
                       "caption"
                       "float"
                       "xcolor"
                       "titling"))
                (add-to-list 'org-latex-packages-alist  (list "" pkg))))
