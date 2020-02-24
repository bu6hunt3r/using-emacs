(require 'org)
(org-babel-load-file
  (expand-file-name "settings.org" "/home/cr0c0/Dokumente/using-emacs/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes q)
 '(font-size--current-size size)
 '(font-size--default-size default-size)
 '(package-selected-packages
   (quote
    (elm-mode undo-tree notmuch rainbow-delimiters mingus cheat org-brain yalinum flycheck htmlize nyan-mode ujelly-theme doom-modeline doom-themes nyx-theme git-gutter counsel swiper lorem-ipsum tabbar ace-window org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
