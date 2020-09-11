(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'org)
(org-babel-load-file
  (expand-file-name "settings.org" "/home/cr0c0/Dokumente/using-emacs/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(crux-shell "/bin/bash")
 '(custom-safe-themes q)
 '(elpy-modules
   '(elpy-module-company elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(flycheck-checker-error-threshold 1000)
 '(font-size--current-size size)
 '(font-size--default-size default-size)
 '(helm-youtube-key 'AIzaSyDfs3niGPbVTgnd7CdinQhWfYo9haClBwQ)
 '(nand2tetris-tools-dir '/home/cr0c0/nand2tetris/tools)
 '(org-agenda-files
   '("~/Dokumente/using-emacs/settings.org" "~/org/brain/todo.org"))
 '(package-selected-packages
   '(go-complete worf web-mode fzf ryo-modal modalka autopair wavefront-obj-mode frog-jump-buffer dumb-jump tickscript-mode company-jedi openwith undo-fu nand2tetris irony-eldoc undo-tree counsel swiper lorem-ipsum tabbar ace-window org-bullets which-key try use-package))
 '(x86-lookup-pdf "/home/cr0c0/Dokumente/intel.pdf"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
