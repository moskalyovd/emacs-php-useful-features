;;; useful-features.el --- Php DocBlock generator

;; Copyright (C) 2016 Dmitriy Moskalyov

;; Author: Dmitriy Moskalyov <moskalyovd@gmail.com>
;; Keywords: php docblock
;; Version: 0.0.1
;; URL: https://github.com/moskalyovd/emacs-php-useful-features

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides useful functions for php.

;;; Code:

(defun oneline-func-to-multiline ()
    "Convert oneline function to multiline function."
    (interactive)
    (let ((line (thing-at-point 'line)) (position (line-beginning-position)))
      (when (string-match "function.+\)" line)
	(beginning-of-line)
	(search-forward "(" (line-end-position))
	(newline-and-indent)
	(while (search-forward "," (line-end-position) t)
	  (newline-and-indent))
	(beginning-of-line)
	(when (search-forward ")" (line-end-position) t)
	  (backward-char 1)
	  (newline-and-indent))
	(setq line (thing-at-point 'line))
	(when (not (search-forward "{" (line-end-position) t))
	  (search-forward "{")
	  (join-line))
	(goto-char position))))

(provide 'useful-features)
;;; useful-features.el ends here
