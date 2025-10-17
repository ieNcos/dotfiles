;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(global-visual-line-mode t)
(setq shell-file-name(executable-find "bash"))
(setq-default vterm-shell
      "/run/current-system/sw/bin/fish") (setq-default
      explicit-shell-file-name "/run/current-system/sw/bin/fish")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/00Core/")

(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))

(setq org-agenda-show-future-repeats 'nil)


(set-face-attribute 'default nil :height 130)




;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(use-package! fcitx
  :config (setq fcitx-remote-command "fcitx5-remote")
          (fcitx-default-setup)
)

;; (after! org

;;   (setq org-todo-keywords
;;      '((sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "DALY(a)"
;;      "|" "DONE(d)" "KILL(k)")
;;      (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
;;      (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))
;;       )


;; )

(map!
    (:map evil-normal-state-map
    ;; 不能加 :n ，不知道为什么
      ";" #'evil-forward-char
      "j" #'evil-backward-char
      "k" #'evil-next-visual-line
      "l" #'evil-previous-visual-line
      "h" #'evil-ex
      "<escape>" #'evil-ex
      "C-e" #'evil-end-of-line
      "x" #'evil-visual-line
      "d" #'evil-delete-char
    )

    (
     :map evil-visual-state-map
      ";" #'evil-forward-char
      "j" #'evil-backward-char
      "k" #'evil-next-line
      "l" #'evil-previous-line
      "x" #'evil-next-line
    )
    ;; (:map evil-insert-state-map
    ;;   "j k" #'evil-forward-char
    ;; )
    (:after evil-org
     :map evil-org-mode-map
       :n "d" #'evil-org-delete-char
       :n "x" #'evil-visual-line
       :v "x" #'evil-next-line
     )
  (:after evil-org-agenda
   :map evil-org-agenda-mode-map
    :m ";" #'evil-forward-char
    :m "j" #'evil-backward-char
    :m "k" #'org-agenda-next-item
    :m "l" #'org-agenda-previous-item
    ;:m "k" #'org-agenda-next-line
    ;:m "l" #'org-agenda-previous-line
  )
)
;; ";"原来是evil-repeat-find-char
;;

(defun lava/duplicate-line ()
  "Duplicate the current line to next line"
  (interactive)
  (let (
         (line-content (buffer-substring (line-beginning-position)(line-end-position)))
         (cursor-column (- (point) (line-beginning-position)))
       )
         (goto-char (line-end-position))
         (newline)
         (insert line-content)
         (goto-char (+ (line-beginning-position) cursor-column))
  )
)

(global-set-key (kbd "C-,") 'lava/duplicate-line)
(map!
 (
  :after evil-org
  :map evil-org-mode-map
  "C-," #'lava/duplicate-line
  :i "C-j" #'+org/return))


;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
