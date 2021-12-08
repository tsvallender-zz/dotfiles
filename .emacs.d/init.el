;; UI Stuff
(load-theme 'wombat)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(setq visible-bell t)

;; GUI only
(when (find-image '((:typexpm :file "pink-gnu.xpm")))
  (tool-bar-mode -1)
  (set-fringe-mode 10)
  (set-face-attribute 'default nil :font "Ubuntu Monospace" :height 280))

;; Initialize package sources
(require 'package)
 (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 '(package-selected-packages '(ivy command-log-mode use-package markdown-mode)))
(custom-set-faces)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config)

(ivy-mode 1)
