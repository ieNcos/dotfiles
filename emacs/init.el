(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
;;(column-number-mode 1)

(setq indent-tabs-mode nil)


;; test
;(global-hl-line-mode 1)


;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (add-hook 'prog-mode-hook 'blink-cursor-mode)




(setq backup-directory-alist '((".*" . "~/.Trash")))

(line-number-mode 1)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (line-beginning-position)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)
    ))

(global-set-key (kbd "C-,") 'rc/duplicate-line)
