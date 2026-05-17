; extends

; -----------------------------------------------------------------------------
; Overrides to match VS Code "Synth Wave Remix" coloring more closely.
; Loaded AFTER the default nvim-treesitter Python query — later captures
; win, so these recategorize specific identifiers without replacing the
; whole query.
; -----------------------------------------------------------------------------

; Default tags every "Capitalized" identifier as @type via:
;   ((identifier) @type (#lua-match? @type "^[A-Z].*[a-z]"))
; That's wrong for ordinary variables like `Lambda`, `Nmin1_bh`, `N`.
; Recategorize them as @variable (pink in our theme).
((identifier) @variable
  (#lua-match? @variable "^[A-Z].*[a-z]"))

; Default tags ALL builtins (int, str, range, print, len, ...) as
; @function.builtin. VS Code distinguishes type constructors (int, float,
; type, ...) from functional builtins (range, print, len, ...).
; Recategorize the type-like ones as @type.builtin (red in our theme).
((identifier) @type.builtin
  (#any-of? @type.builtin
    "bool" "bytearray" "bytes" "complex" "dict" "float" "frozenset"
    "int" "list" "memoryview" "object" "set" "str" "tuple" "type"))

; Same for when they appear as call functions: type(x), float(x), int(x), ...
((call
   function: (identifier) @type.builtin)
  (#any-of? @type.builtin
    "bool" "bytearray" "bytes" "complex" "dict" "float" "frozenset"
    "int" "list" "memoryview" "object" "set" "str" "tuple" "type"))

; The default query includes `range` in @type.builtin (technically it IS a
; class). But VS Code treats it functionally — recategorize it back to
; @function.builtin so it shows cyan, matching `print`, `len`, `map`, etc.
((identifier) @function.builtin
  (#any-of? @function.builtin "range"))

((call
   function: (identifier) @function.builtin)
  (#any-of? @function.builtin "range"))

; String prefix (f", r", b", rb", etc.) — highlight distinctly from content.
(string
  (string_start) @string.delimiter)

(string
  (string_end) @string.delimiter)
