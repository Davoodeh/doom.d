;;; +org.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook 'set-bidi-env)

(setq
 ;; org-startup-folded t
 org-export-with-sub-superscripts nil ; treats underscore as just an underscore
 auto-mode-alist (append '(; opens specific extensions with given modes
                           ("\\.sent\\'" . org-mode)
                           ("\\.snt\\'"  . org-mode))
                         auto-mode-alist))

;; Make Babel Php much like real Php files require <?php and ?>.
;; This helps with Minted and correct highlighting.
(after! ob-php
        (defun org-babel-execute:php (body params)
          "Orgmode Babel PHP evaluate function for `BODY' with `PARAMS'."
          (let* ((cmd (concat org-babel-php-command " " org-babel-php-command-options)))
                (org-babel-eval cmd body))))

(after! ob-plantuml
        (let ((i (assoc :cmdline org-babel-default-header-args:plantuml)))
          (setcdr i (concat (cdr i) " "
                            "-SbackgroundColor=FFFFFF00 "
                            "-SdefaultFontName=" (or mono-font "mono") " "
                            "-Sdpi=250")))
        (setenv "PLANTUML_ENCODING" "deflate"))

(after! ox-latex
        (add-to-list 'org-latex-caption-above 'src-block)
        (add-to-list 'org-latex-classes '("a4article" "\\documentclass[a4paper]{article}"
                                                      ("\\section{%s}" . "\\section*{%s}")
                                                      ("\\subsection{%s}" . "\\subsection*{%s}")
                                                      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                                      ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                                      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
        (add-to-list 'org-latex-classes '("a4report" "\\documentclass[a4paper]{report}"
                                                     ("\\part{%s}" . "\\part*{%s}")
                                                     ("\\chapter{%s}" . "\\chapter*{%s}")
                                                     ("\\section{%s}" . "\\section*{%s}")
                                                     ("\\subsection{%s}" . "\\subsection*{%s}")
                                                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
        (add-to-list 'org-latex-classes '("a4book" "\\documentclass[a4paper]{book}"
                                                   ("\\part{%s}" . "\\part*{%s}")
                                                   ("\\chapter{%s}" . "\\chapter*{%s}")
                                                   ("\\section{%s}" . "\\section*{%s}")
                                                   ("\\subsection{%s}" . "\\subsection*{%s}")
                                                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
        (setq
         ;; org-latex-bib-compiler "biber"
         org-latex-default-class "a4article"
         org-latex-minted-options '(("linenos") ("mathescape"))
         org-latex-pdf-process '("latexmk -g -pdf -pdflatex=\"%latex\" -outdir=%o %f"))
        ;; (add-to-list 'org-latex-packages-alist  '("backend=biber" "biblatex"))
        (add-to-list 'org-latex-packages-alist  '("square, numbers" "natbib")))

(use-package! org-ref :config
              (let ((def (or (getenv "BIBFILE") (concat (or (getenv "XDG_DATA_HOME") "~/.local/share") "/bib.bib"))))
                (add-to-list 'bib-files def)
                (setq
                 org-ref-bibliography-notes (concat (file-name-directory def) "/bib.org")
                 org-ref-default-bibliography bib-files
                 org-ref-pdf-directory (concat (or (getenv "XDG_DOWNLOAD_DIR") "~/Downloads") "/org-ref-pdfs")
                 refftex-default-bibliography bib-files)))
