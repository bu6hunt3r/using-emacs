(require 'thingatpt)
(require 'seq)
(require 'tramp)

(declare-function dired-get-file-for-visit "dired")
(defvar recentf-list)

(defgroup crux nil
  "crux configuration."
  :prefix "crux-"
  :group  'convenience)

(defcustom crux-indent-sensitive-modes
  "Modes for which auto-indenting is suppressed &optional ARGS"
  '(conf-mode coffee-mode python-mode slim-mode yaml-mode)
  :type 'list
  :group 'crux)

(defcustom crux-untabify-sensitive-modes
  "Modes for which untabify is suppressed &optional ARGS"
  '(makefile-bsdmake-mode)
  :type 'list
  :group 'crux)

(defcustom crux-shell (getenv "SHELL")
   "The default shell to run with `crux-visit-term-buffer"
   :type 'string
   :group 'crux)

(defcustom crux-shell-bash-init-files
  '("$BASH_ENV" "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.bash_login"
    "$HOME/.profile" "$HOME/.bash_logout" "/etc/bashrc" "/etc/bash_profile"
    "/etc/bash_login" "/etc/profile" "/etc/bash_logout")
  "The default init files of bash."
  :type 'list
  :group 'crux)

(defcustom crux-shell-tcsh-init-files
  '("$HOME/.login" "$HOME/.cshrc" "$HOME/.tcshrc" "$HOME/.logout"
    "/etc/csh.cshrc" "/etc/csh.login" "/etc/csh.logout")
  "The default init files of tcsh."
  :type 'list
  :group 'crux)

(defcustom crux-shell-fish-init-files
  '("$HOME/.config/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish")
  "The default init files of fish."
  :type 'list
  :group 'crux)

(defcustom crux-shell-ksh-init-files
  '("$HOME/.profile" "$ENV" "/etc/profile")
  "The default init files of ksh."
  :type 'list
  :group 'crux)

(defvar crux-term-buffer-name "ansi"
  "The default `ansi-term' name used by `crux-visit-term-buffer'.
This variable can be set via .dir-locals.el to provide multi-term support.")

;;;###autoload
(defun crux-open-with (arg)
  "Open visited file in default external program.
When in dired mode, open file under the cursor"
  (interactive "P")
  (let* ((current-file-name
	  (if (eq major-mode 'dired-mode)
	      (dired-get-file-for-visit)
	    buffer-file-name))
	 (open (pcase system-type
		 (`darwin "open")
		 ((or `gnu `gnu/linux ´gnu/kfreebsd) "xdg-open")))
	 (program (if (or arg (not open))
		      (read-shell-command "Open current file with: ")
		    open)))
    (call-process program nil 0 nil current-file-name)))

(defun crux-buffer-mode (buffer-or-name)
  "Retrieve the `major-mode' for BUFFER-OR-NAME"
  (with-current-buffer buffer-or-name
    major-mode))

 (defun crux-start-or-swith-to (function buffer-name)
  "Invoke FUNCTION if there is no buffer with BUFFER-NAME.
Otherwise switch to the buffer named BUFFER-NAME.  Don't clobber
the current buffer."
  (if (not (get-buffer buffer-name))
      (progn
	(split-window-sensibly (selected-window))
	(other-window 1)
	(funcall function))
    (switch-to-buffer-other-window buffer-name)))

;;;###autoload
(defun crux-visit-term-buffer ()
  "Create or visite a terminal buffer.
If the process in that biffer died, ask to restart."
  (interactive)
  (crux-start-or-swith-to (lambda ()
			    (ansi-term crux-shell (concat crux-term-buffer-name "-term")))
			  (format "*%s-term*" crux-term-buffer-name))
  (when (and (null (get-buffer-process (current-buffer)))
	     (y-or-no-p "The process has died. Do you want to restart it? "))
    (kill-buffer-and-window)
    (crux-visit-term-buffer)))

;;;###autoload
(defun crux-indent-rigidly-and-copy-to-clipboard (begin end arg)
  "Indent region between BEGIN and END by ARG columns and copy to clipboard."
  (interactive "r\nP")
  (let ((arg (or arg 4))
	(buffer (current-buffer)))
    (with-temp-buffer
      (insert-buffer-substring-no-properties buffer begin end)
      (indent-rigidly (point-min) (point-max) arg)
      (clipboard-kill-ring-save (point-min) (point-max)))))



   
