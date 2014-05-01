" Syntax highlighting for jasmine specs (used by http://github.com/thomd/vim-jasmine).

" if b:current_syntax is defined, some other syntax files, earlier in 'runtimepath' was already loaded
if exists("b:current_syntax")
  finish
endif

if &ft =~ "coffee"
  runtime! syntax/coffee.vim
else
  runtime! syntax/javascript.vim
endif

" match the case of syntax elements
syntax case match

" keywords
syntax keyword jasmineSuite describe it beforeEach afterEach
syntax keyword jasmineDisabled xdescribe xit
syntax keyword jasmineExpectation expect
syntax region jasmineNot start=/not/ end=/\.to/me=s-1
syntax match jasmineMatcher /\.to\h\+/
syntax keyword jasmineSpy spyOn
syntax match jasmineSpyMatcher /and\h\+/

hi def link jasmineSuite Statement
hi def link jasmineDisabled Error
hi def link jasmineExpectation Statement
hi def link jasmineNot Special
hi def link jasmineMatcher Statement
hi def link jasmineSpy Special
hi def link jasmineSpyMatcher Statement

let b:current_syntax = "jasmine"
