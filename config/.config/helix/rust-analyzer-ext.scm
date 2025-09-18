(require "helix/editor.scm")
(require "helix/commands.scm")
(require "helix/configuration.scm")
(require "helix/misc.scm")
(require "helix/static.scm")
(require-builtin helix/core/text as text.)

(provide shell rust-analyzer-expand-macro)
(provide shell rust-analyzer-parent-module)

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

(define (focused-document->rope)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor->text focus-doc-id)))

(define (current-document-cursor-line)
  (define rope (focused-document->rope))
  (define pos (cursor-position))
  (text.rope-char->line rope (cursor-position)))

(define (current-document-cursor-column)
  (define rope (focused-document->rope))
  (define pos (cursor-position))
  (define line (text.rope-char->line rope (cursor-position)))
  (define line-start (text.rope-line->char rope line))
  (- pos line-start))

(define (text-document-position-params)
  (hash
    "textDocument" (hash "uri" (string-append "file://" (current-path)))
    "position" (hash
      "line" (get-current-line-number)
      "character" (get-current-line-character "utf-8"))))

(define (jump-to-location uri pos)
  (define path (trim-start-matches uri "file://"))
  (define line (hash-get pos 'line))
  (define column (hash-get pos 'character))
  (open path)
  (goto (number->string (+ 1 (exact line)))))

(define (jump-to-link link)
  (cond
    ((hash-contains? link 'targetUri) (begin
      (define uri (hash-get link 'targetUri))
      (define pos (hash-get (hash-get link 'targetRange) 'start))
      (jump-to-location uri pos)))
    ((hash-contains? link 'uri) (begin
      (define uri (hash-get link 'uri))
      (define pos (hash-get (hash-get link 'range) 'start))
      (jump-to-location uri pos)))))

;;@doc
;; Expands the macro under the cursor
(define (rust-analyzer-expand-macro)
  (send-lsp-command "rust-analyzer"
    "rust-analyzer/expandMacro"
    (text-document-position-params)
    (lambda (result)
      (cond
        ((void? result) (set-error! "No macro found under cursor"))
        ((hash? result) (begin
                          (define name (hash-get result 'name))
                          (define expansion (hash-get result 'expansion))
                          (vsplit-new)
                          (set-scratch-buffer-name! (string-append "[" name "]"))
                          (set-language "rust")
                          (insert_string expansion)
                          (goto_file_start)))))))

;;@doc
;; Expands the macro under the cursor
(define (rust-analyzer-parent-module)
  (send-lsp-command "rust-analyzer"
    "experimental/parentModule"
    (text-document-position-params)
    (lambda (result)
      (cond
        ((void? result) (set-error! "Parent module not found"))
        ((list? result) (jump-to-link (first result)))))))
