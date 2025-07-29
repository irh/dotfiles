(require "helix/editor.scm")
(require "helix/commands.scm")
(require "helix/configuration.scm")
(require "helix/misc.scm")
(require "helix/static.scm")
(require-builtin helix/core/text as text.)

(provide shell rust-analyzer-expand-macro)

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

;;@doc
;; Expands the macro under the cursor
(define (rust-analyzer-expand-macro)
  (send-lsp-command "rust-analyzer"
    "rust-analyzer/expandMacro"
    (hash
      "textDocument" (hash "uri" (string-append "file://" (current-path)))
      "position" (hash
        "line" (current-document-cursor-line)
        "character" (current-document-cursor-column)))
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
