" Vim syntax file
" Language: Endo
" Maintainer: Christian Parpart

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword endoKeyword let mut fun type rec and of as global
syn keyword endoKeyword match with when
syn keyword endoKeyword if then else elif fi
syn keyword endoKeyword for in do done while
syn keyword endoKeyword try return break continue export

" Boolean literals
syn keyword endoBoolean true false

" Option/Result constructors
syn keyword endoConstructor Ok Error Some None

" Builtin functions
syn keyword endoBuiltin print println

" Numbers
syn match endoNumber "\<\d\+\>"
syn match endoNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match endoNumber "\<0[oO][0-7]\+\>"
syn match endoNumber "\<0[bB][01]\+\>"
syn match endoFloat "\<\d\+\.\d*\([eE][-+]\?\d\+\)\?\>"
syn match endoFloat "\<\d\+[eE][-+]\?\d\+\>"

" Strings
syn region endoString start='"' skip='\\"' end='"' contains=endoInterpolation,endoEscape
syn region endoRawString start="'" skip="\\'" end="'"
syn match endoEscape "\\[nrt\\$\"]" contained
syn match endoInterpolation "\$[a-zA-Z_][a-zA-Z0-9_]*" contained
syn match endoInterpolation "\${[^}]*}" contained
syn match endoInterpolation "\$([^)]*)" contained

" Operators
syn match endoOperator "|>"
syn match endoOperator "->"
syn match endoOperator "<-"
syn match endoOperator "=>"
syn match endoOperator "::"
syn match endoOperator "&&"
syn match endoOperator "||"
syn match endoOperator "=="
syn match endoOperator "!="
syn match endoOperator "<="
syn match endoOperator ">="
syn match endoOperator "\*\*"
syn match endoOperator ">>"
syn match endoOperator "<<"
syn match endoOperator "[+\-*/%<>=!?@#]"

" Pipe in match arms
syn match endoDelimiter "^\s*|"

" Comments
syn match endoComment "#.*$"
syn match endoComment "//.*$"
syn region endoComment start="(\*" end="\*)"

" Highlight links
hi def link endoKeyword Keyword
hi def link endoBoolean Boolean
hi def link endoConstructor Type
hi def link endoBuiltin Function
hi def link endoNumber Number
hi def link endoFloat Float
hi def link endoString String
hi def link endoRawString String
hi def link endoEscape SpecialChar
hi def link endoInterpolation Special
hi def link endoOperator Operator
hi def link endoDelimiter Delimiter
hi def link endoComment Comment

let b:current_syntax = "endo"
