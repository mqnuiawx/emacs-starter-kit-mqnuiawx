

;;;color
(require 'color-theme)
(color-theme-twilight)
;;;end color

(defun count-word-region (start end)
  "Count the word number of a region."
  (interactive "r")
  (save-excursion
    (goto-char start)
    (let ((count 0))
      (while (and (< (point) end) (re-search-forward "\\w+\\W*" end t))
        (setq count (+ 1 count)))
         count
         (message "the work number is %d." count))))


;;;cedet
(setq load-path (append load-path '("/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/common/icons" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/semantic/ctags" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/semantic/symref" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/semantic/wisent" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/semantic/bovine" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/contrib" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/cogre" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/speedbar" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/ede" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/srecode" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/semantic" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/eieio" "/home/mqnuiawx/code/emacs-starter-kit/mqnuiawx/cedet-1.0pre7/common/")))
(require 'cedet)
(require 'semantic-ia)
(require 'semantic-gcc)
(require 'semanticdb-global)

(global-ede-mode t)

;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;(semantic-show-unmatched-syntax-mode)
;;;end cedet


;;;ecb
;(add-to-list load-path (concat user-specific-dir "/ect"))
;(require 'ecb)
;(global-set-key (kbd "C-c w a") 'ecb-activate)
;(global-set-key (kbd "C-c w u") 'ecb-deactivate)
;;;end ecb


;;;jdee
(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/emacs/site/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/emacs/site/elib"))

(setq defer-loading-jde t)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))

(defun my-jde-mode-hook ()
  (setq c-basic-offset 4))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)
;;;end jdee


;;;xgtags
(require 'xgtags)
(require 'xgtags-extension)
;;;end xgtags


;;;highlight-symbol
(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prbev)
(global-set-key [control met] 'highlight-symbol-query-replace)
;;;end highlight-symbol

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<C-prior>") 'next-buffer)
(global-set-key (kbd "<C-next>") 'previous-buffer)
(global-set-key (kbd "C-o") 'find-file-at-point)














