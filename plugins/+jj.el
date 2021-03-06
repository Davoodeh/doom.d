;;; plugins/+jj.el -*- lexical-binding: t; -*-

;; TODO make all of it only one function
;; XXX Why it's impossible to use a var as input for general-imap?
(after! general
  (general-evil-setup)
        (general-imap "j" (general-key-dispatch 'self-insert-command :timeout 0.25 "j" '(lambda () (interactive) (evil-normal-state) (set-lang "us"))))
        (general-imap "k" (general-key-dispatch 'self-insert-command :timeout 0.25 "k" '(lambda () (interactive) (evil-normal-state) (set-lang "us"))))
        (general-imap "ت" (general-key-dispatch 'self-insert-command :timeout 0.25 "ت" '(lambda () (interactive) (evil-normal-state) (set-lang "us"))))
        (general-imap "о" (general-key-dispatch 'self-insert-command :timeout 0.25 "о" '(lambda () (interactive) (evil-normal-state) (set-lang "us"))))
        (general-imap "J" (general-key-dispatch 'self-insert-command :timeout 0.25 "J" '(lambda () (interactive) (evil-normal-state) (capsoff))))
        (general-imap "K" (general-key-dispatch 'self-insert-command :timeout 0.25 "K" '(lambda () (interactive) (evil-normal-state) (capsoff))))
        (general-nmap "о" (lambda () (interactive) (evil-normal-state) (set-lang "us")))
        (general-nmap "л" (lambda () (interactive) (evil-normal-state) (set-lang "us")))
        (general-nmap "ت" (lambda () (interactive) (evil-normal-state) (set-lang "us")))
        (general-nmap "ن" (lambda () (interactive) (evil-normal-state) (set-lang "us"))))
  ;; (cl-flet ((callback (key)
  ;;                     (interactive)
  ;;                     (general-key-dispatch 'self-insert-command :timeout 0.25 key '(lambda () (interactive) (evil-normal-state) (set-lang "us")))))
  ;;   (general-imap "j" (callback "j"))
  ;;   (general-imap "k" (callback "k"))
  ;;   (general-imap "ت" (callback "ت"))
  ;;   (general-imap "о" (callback "о")))
  ;; (cl-flet ((callback ()
  ;;                     (interactive)
  ;;                     (lambda () (interactive) (evil-normal-state) (set-lang "us"))))
  ;;   (general-nmap "о" (callback))
  ;;   (general-nmap "л" (callback))
  ;;   (general-nmap "ت" (callback))
  ;;   (general-nmap "ن" (callback)))
  ;; (cl-flet ((callback (key)
  ;;                     (interactive)
  ;;                     (general-key-dispatch 'self-insert-command :timeout 0.25 key '(lambda () (interactive) (evil-normal-state) (shell-command "xset q | grep -q '.*Caps\sLock.*on' && xdotool key Caps_Lock" nil nil)))))
  ;;   (general-imap "J" (callback "J"))
  ;;   (general-imap "K" (callback "K"))))
  ;; (general-imap "ت" (inormal "ت"))
  ;; (general-imap "о" (inormal "о"))
  ;; (general-nmap "о" (normal (set-lang "us")))
  ;; (general-nmap "л" (normal (set-lang "us")))
  ;; (general-nmap "ت" (normal (set-lang "us")))
  ;; (general-nmap "ن" (normal (set-lang "us"))))
  ;; (dolist (key '("j"))
  ;; (let ((imap (lambda ()
  ;;               (interactive)
  ;;               (general-key-dispatch '(lambda () (interactive) (insert "us"))))))
  ;;   (general-imap "" )))
  ;; (cl-flet ((us '(lambda () (interactive) (evil-normal-state) (set-lang "us"))))
  ;; (general-imap "j" (general-key-dispatch 'self-insert-command :timeout 0.25 "j" 'us))
  ;; )
;; (add-hook 'evil-mode-hook ; FIXME doesn't work
;;       (lambda () (local-unset-key (kbd "M-i"))))
;; (general-nmap :prefix "M"
;;   "i" '(lambda ()
;;          (set-lang "fa")
;;          (evil-insert))))
