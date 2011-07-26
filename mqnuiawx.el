


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
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
;(semantic-show-unmatched-syntax-mode)
;;;end cedet


;;;ecb
(add-to-list 'load-path
             (concat dotfiles-dir  "mqnuiawx/ecb"))

(require 'ecb)
(global-set-key (kbd "C-c w a") 'ecb-activate)
(global-set-key (kbd "C-c w u") 'ecb-deactivate)
;;;end ecb


;;;jdee
;; (setq debug-on-error t)

;; (add-to-list 'load-path (expand-file-name "~/emacs/site/cedet/common"))
;; (add-to-list 'load-path (expand-file-name "~/emacs/site/elib"))

;; (setq defer-loading-jde t)

;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;; 	    (append
;; 	     '(("\\.java\\'" . jde-mode))
;; 	     auto-mode-alist)))
;;   (require 'jde))

;; (defun my-jde-mode-hook ()
;;   (setq c-basic-offset 4))

;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)
;;;end jdee


;;;xgtags
(require 'xgtags)
(require 'xgtags-extension)
;;;end xgtags


;;;highlight-symbol
(require 'highlight-symbol)

;;;tabbar
(require 'tabbar)
(tabbar-mode 1)
(setq EmacsPortable-global-tabbar 't) ; If you want tabbar

(require 'tabbar-ruler)
(defun tabbar-buffer-groups (buffer)
  "Return the list of group names BUFFER belongs to.
 Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      '("Emacs Buffer"))
     ((eq major-mode 'dired-mode)
      '("Dired"))
     )))

;(setq tabbar--buffer-show-groups t)
 ;; from Xah Lee
;(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
;;;tabbar end

;;


;;; python mode
(add-to-list 'load-path (concat dotfiles-dir  "mqnuiawx/python-mode-6.0"))


(setq ipython-command "/usr/bin/ipython")
(setq py-python-command-args '(""))
;(require 'python-mode)
(require 'ipython)

(require 'anything)
(require 'anything-config)
(require 'anything-ipython)
(when (require 'anything-show-completion nil t)
   (use-anything-show-completion 'anything-ipython-complete
                                 '(length initial-pattern)))
;;; autopair
(require 'autopair)
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode t)
(add-hook 'lisp-mode-hook
          #'(lambda () (setq autopair-dont-activate t)))
;;; end autopair

(require 'comint)
(define-key comint-mode-map (kbd "M-n") 'comint-next-input)
(define-key comint-mode-map (kbd "M-p") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(add-hook 'lisp-mode-hook
          #'(lambda () (setq autopair-dont-activate t)))
(add-hook 'python-mode-hook
          #'(lambda ()
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

(require 'python-pep8)
(require 'python-pylint)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'yasnippet-bundle)
(require 'pretty-mode)


;;; pretty show

;;color theme
(require 'color-theme)
(require 'color-theme-railscasts)
(color-theme-railscasts)
;;end color

;; pretty lambda
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
;; end pretty lambda


;; Hide display of parens
(defface paren-face
  '((((class color) (background dark))
     (:foreground "grey20"))
    (((class color) (background light))
     (:foreground "grey80")))
  "Face used to dim parentheses.")

(add-hook 'emacs-lisp-mode-hook
 	  (lambda ()
 	    (font-lock-add-keywords nil
 				    '(("(\\|)" . 'paren-face)))))
;; end Hide display of parens

;;; end pretty show

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
(global-set-key (kbd "M-.") 'xgtags-find-tag)
(global-set-key (kbd "C-.") 'xgtags-find-tag-from-here)
(global-set-key (kbd "C-,") 'xgtags-find-with-grep)
(global-set-key (kbd "M-,") 'xgtags-pop-stack)

