(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "william")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)

(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map "\C-g" 'evil-normal-state)
(define-key evil-normal-state-map (kbd ", h") 'windmove-left)
(define-key evil-normal-state-map (kbd ", l") 'windmove-right)
(define-key evil-normal-state-map (kbd ", k") 'windmove-up)
(define-key evil-normal-state-map (kbd ", j") 'windmove-down)
(define-key evil-normal-state-map (kbd ", f") 'find-file)
(define-key evil-normal-state-map (kbd ", b") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd ", x") 'kill-buffer)
(define-key evil-normal-state-map (kbd ", d") 'dired)

(set-default-font "CMU Typewriter Text-13")
;; (set-default-font "CMU Typewriter Text-10")
;; (set-default-font "CMU Concrete-13")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-ghc hlint-refactor company-ghci ghc helm-hoogle haskell-mode use-package dante evil-mc magit dired-subtree go-mode 0blayout slime lua-mode evil-quickscope evil-args)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#ffffea"))))
 '(fringe ((t (:background "#ffffea"))))
 '(header-line ((t (:background "#aeeeee" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line ((t (:background "#aeeeee" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#eaffff" :foreground "grey20" :box (:line-width -1 :color "grey75") :weight light))))
 '(region ((t (:background "#eaea9e")))))

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(setq inferior-lisp-program "/usr/bin/sbcl")

(defun onload (_)
  (load-file "/home/william/.emacs"))

(add-hook 'after-make-frame-functions #'onload)

(use-package dante
	     :ensure t
	     :commands 'dante-mode
	     :init
	     (add-hook 'haskell-mode-hook 'dante-mode)
	     (add-hook 'haskell-mode-hook 'flycheck-mode))

(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      evil-shift-width 8
      indent-tabs-mode t)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))
