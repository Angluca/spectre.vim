if exists("b:current_syntax")
    finish
endif

syn keyword spectreKeyword val const static pub fn spec
syn keyword spectreKeyword mut as
"syn keyword spectreKeyword parallel overload single
"syn keyword spectreKeyword model enum union

syn keyword spectreType ptrdiff untyped typed generic
syn keyword spectreType bool char byte void string self
syn keyword spectreType i8 i16 i32 i64 u8 u16 u32 u64 isize usize
syn keyword spectreType int uint long ulong
syn keyword spectreType float f32 f64

syn keyword spectreLabel default ref
syn keyword spectreOperator and or is mod
syn keyword spectreConstant true false none
syn keyword spectreSComment assert some ok err
syn match   spectreSMacro   '\v<(put)>'
syn match   spectreNew      '\v<(new|[m]?alloc|create)>'
syn match   spectreFree     '\v<(free)>'

syn keyword spectreRepeat while loop for in to
syn keyword spectreStatement break continue return defer
syn keyword spectreConditional if else elif match
syn keyword spectreConditional pre post invariant
syn keyword spectreInclude export include extern foreign opaque guarded

syn keyword spectreException throw try catch cast unsafe raw trust
syn keyword spectrePanic panic enforce
"syn keyword spectreSuper   private

" -- shader
"syn match   spectreKeyword  '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
"syn match   spectreType     '\v<(texture|texture2D)>\s'
"syn match   spectreType     '\v<bool[234]?>'
"syn match   spectreType     '\v<int[234]?>'
"syn match   spectreType     '\v<uint[234]?>'
"syn match   spectreType     '\v<half[234]?>'
"syn match   spectreType     '\v<float([234](x[234])?)?>'
"syn match   spectreType     '\v<[dbui]?vec[234]>'
syn match   spectreType     '\v<vec[234][dbfhui]?>'
syn match   spectreType     '\v<mat[234](x[234]f)?>'
syn match   spectreType     '\v<(vec|mat|list)\ze\['

syn match spectrePreProc    '[@]'
syn match spectreSymbol     '[,;:\.]'
syn match spectreOperator   '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match spectreConstant   '[{}\[\]()]'
syn match spectreType       '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match spectreType       '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match spectreType       '\v<\w+_[tscemui]>'
syn match spectreRepeat     '\v([^\.](\.|::|-\>))@<=\w\w*'
syn match spectreMacro      '\v<[_]*\u+[A-Z0-9_]*>'
syn match spectreType       '\v<[_]*\u([A-Z0-9_]*[a-z]+\w*)*>'
syn match spectreMacro      '\v<[_]*\u+[A-Z0-9]_[A-Zx0-9_]+>'
syn match spectreType       '\v\.?\zs<([iu][0-9]{1,3})?>'
"syn match spectreType       '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match spectreFunc       '\v\l\w+\ze((\[[^=;]*\])|((::)?\<.*\>))*\s*\('
syn match spectreException  '\v(\W@<=[~&!*^]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[!?]+\ze\W)'
syn match spectreType       '\v(::)@<=\w\w*'
syn match spectreLabel      '\v(\-\>)|(::)'
syn match spectreType       '\v<[uif]\d+(x\d+)+>' "f64x6

syn match spectreInclude    '\v<(use)\ze\s*\('
syn match spectreSMacro     '\v<(result|option)\ze\s*\['
"syn match spectreMacro      '\v^\s*\[.{-}\]'
"syn match spectreType       '\v<(str)\ze\s*\('
"syn match spectreLabel      '\v<(addr)\ze\s*\('
syn match spectreSMacro     '\v<(list)\ze\s*\('
syn match spectreAdded      '\v^\s*<(test)\ze\s*\{'
syn match spectreInclude    '\v^\s*<(link|lib)>'
syn match spectreSComment   '\v<\@(\w+)>'
syn match spectreRepeat     '\v<\w+\ze\s*\=\s*use\s*\('

syn match spectreConstant contained /\v[<>]/
syn region spectreConstantSpec
    \ oneline
    \ keepend
    \ contains=spectreType,spectreOperator,spectreMacro,spectreSComment,spectreConstant,spectreConstantSpec,spectreSymbol
    \ start=/\v\<%(%(%(\&\&|\|\||\(|\{|\"|\')@!.){-}\>)@=/
    \ end=/\v\>/

"hi def spectreSymbol ctermfg=DarkGray guifg=DarkGray
hi def link spectreSMacro   SpecialComment
hi def link spectreNew      Added
hi def link spectreFree     Exception
hi def link spectreTitle    Title
hi def link spectreAdded    Added
hi def link spectreStruct   Changed
hi def link spectreConstant Constant
hi def link spectreSymbol   Changed
hi def link spectreMacro    Macro
hi def link spectreSComment SpecialComment
hi def link spectreFunc     Function
hi def link spectreTypedef  Changed
"hi def spectreType ctermfg=DarkCyan guifg=DarkCyan
hi def link spectreType     MoreMsg
"hi def link spectreType SpecialComment
"hi def spectreSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link spectreSelf     Label
hi def link spectreModeMsg  ModeMsg

syn match  spectreSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  spectreSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  spectreCharacter        "'[^']*'" contains=spectreSpecialChar,spectreSpecialCharError
syn match  spectreCharacter        "'\\''" contains=spectreSpecialChar
syn match  spectreCharacter        "'[^\\]'"

"syn region    spectreString      matchgroup=spectreString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=spectreEscape,@Spell
syn region    spectreString      matchgroup=spectreString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    spectreString      matchgroup=spectreString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match spectreNumber "\v<[0-9_]+>"
syn match spectreNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match spectreNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match spectreFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
"syn match spectreFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match spectreFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match spectreInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match spectreInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match spectreInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match spectreInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match spectreFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match spectreFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match spectreFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match spectreFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match spectreEscape '\\[\\'"0abfnrtv]' contained display
syn match spectreEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match spectreFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=spectreEscape display
syn match spectreFormat '{{\|}}' contained display


hi def link spectrePreProc               PreProc
hi def link spectreSuper                 Title
"hi def link spectreFloat                 Constant
hi def link spectreFloat                 Underlined
hi def link spectreInteger               Number
hi def link spectreEscape                SpecialComment
hi def link spectreFormat                SpecialChar

hi def link spectreKeyword               Keyword
hi def link spectreInclude               Include
hi def link spectreLabel                 Label
hi def link spectreConditional           Conditional
hi def link spectreRepeat                Repeat
hi def link spectreStatement             Statement
"hi def link spectreType                  Type
hi def link spectreNumber                Number
hi def link spectreComment               Comment
hi def link spectreOperator              Operator
hi def link spectreCharacter             Character
hi def link spectreString                String
hi def link spectreTodo                  Todo
hi def link spectreSpecial               Special
hi def link spectreSpecialError          Error
hi def link spectreSpecialCharError      Error
hi def link spectreString                String
hi def link spectreCharacter             Character
hi def link spectreSpecialChar           SpecialChar
hi def link spectreException             Exception
hi def link spectrePanic                 Exception

" 结构类型的颜色
syn match spectreTypedef "\h\w*" display contained
syn match spectreParenParams "\v\([^)]*\)" contained transparent
    \ nextgroup=spectreTypedef skipwhite
syn keyword spectreKeyword union struct model enum type spec
    \ nextgroup=spectreParenParams,spectreTypedef skipwhite
syn keyword spectreMacro when nextgroup=spectreTypedef skipwhite

" union结构范围颜色
"hi def link spectreRegionKeyword Keyword
"syn keyword spectreRegionKeyword union contained
"syn match spectreRepeat "\v\(@<!\w+\ze\s*\(" display contained
"syn match spectreSymbol "\v\(@<!\h\w*\ze\s*\=\s*\{" display contained
"syn region spectreUnionDef
    "\ start="\v<union>[^{]*\{"
    "\ end="\v\}"
    "\ contains=spectreMacro,spectreParenParams,spectreType,spectreOperator,spectreConstant,spectreLabel,spectreKeyword,spectreSymbol,spectreRegionKeyword,spectreRepeat
    "\ keepend

syn match   spectreFunc "\h\w*" display contained
syn keyword spectreKeyword fn nextgroup=spectreFunc skipwhite

syn keyword spectreTodo contained TODO FIXME XXX NOTE
syn region  spectreComment  start="/\*" end="\*/" contains=spectreTodo,@Spell
syn match   spectreComment  "//.*$" contains=spectreTodo,@Spell
syn match   spectreSymbol   "\\\\.*$"
syn match   spectrePreProc  '\#.*$'

let b:current_syntax = "spectre"
