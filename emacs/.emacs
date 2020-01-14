;; packages
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(package-selected-packages
   (quote
    (lsp-mode gruvbox-theme projectile evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; defaults
(setq inhibit-splash-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(toggle-scroll-bar -1)
(load-theme 'gruvbox t)
(set-default-font "Fira Code-12")
(auto-save-mode 0)

(defun save-buffer-force ()
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun split-window-upper ()
  (interactive)
  (split-window-below)
  (windmove-up))

(defun split-window-left ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun nop ()
  (interactive)
  ())

;; set up evil mode
(evil-mode 1)
(evil-select-search-module 'evil-search-module 'evil-search)

;; evil bindings
(evil-set-leader 'normal (kbd "SPC"))

(evil-global-set-key 'normal (kbd "<leader>x") 'execute-extended-command)

(evil-global-set-key 'normal (kbd "<leader>w") 'save-buffer-force)
(evil-global-set-key 'normal (kbd "<leader>q") 'delete-window)
; (evil-global-set-key 'insert (kbd "j k") 'evil-normal-state)
(evil-global-set-key 'normal (kbd "C-u") 'evil-scroll-up)
(evil-global-set-key 'insert (kbd "C-h") 'backward-delete-char-untabify)
(evil-global-set-key 'insert (kbd "C-h") 'backward-delete-char-untabify)

(evil-global-set-key 'normal (kbd ",") 'evil-search-forward)
(evil-global-set-key 'visual (kbd ",") 'evil-search-forward)
(evil-global-set-key 'normal (kbd "/") 'nop)
(evil-global-set-key 'visual (kbd "/") 'nop)

(evil-global-set-key 'normal (kbd ";") 'evil-ex)
(evil-global-set-key 'visual (kbd ";") 'evil-ex)
(evil-global-set-key 'normal (kbd ":") 'nop)
(evil-global-set-key 'visual (kbd ":") 'nop)

;; window movement
(evil-global-set-key 'normal (kbd "C-h") 'windmove-left)
(evil-global-set-key 'normal (kbd "C-l") 'windmove-right)
(evil-global-set-key 'normal (kbd "C-k") 'windmove-up)
(evil-global-set-key 'normal (kbd "C-j") 'windmove-down)

;; create windows
(evil-global-set-key 'normal (kbd "<leader>.W") 'split-window-upper)
(evil-global-set-key 'normal (kbd "<leader>.w") 'split-window-left)
(evil-global-set-key 'normal (kbd "<leader>,W") 'split-window-below)
(evil-global-set-key 'normal (kbd "<leader>,w") 'split-window-right)

;; fuzzy search
;; in files
;; for files



;; set up lsp server
(add-hook 'typescript-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)

;; set up projectile
