(require "helix/editor.scm")
(require "helix/commands.scm")
(require "helix/components.scm")
(require "helix/configuration.scm")
(require "helix/misc.scm")
(require "helix/static.scm")

(provide shell expand-macro)

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

;;@doc
;; Expands the macro under the cursor
(define (expand-macro)
  (define uri (hash "uri" (string-append "file://" (current-path))))

  (send-lsp-command "rust-analyzer"
    "rust-analyzer/expandMacro"
    (hash
      "textDocument"
      uri
      "position"
      (hash
        "line"
        (get-current-line-number)
        "character"
        (get-current-column)))
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
