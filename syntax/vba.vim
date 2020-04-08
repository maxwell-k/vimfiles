" syntax/vba.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
"see :help group-name for a list of groups
"
syntax case match

syn region   Comment      start="\(^\|\s\)\'" end="$" contains=Todo,@Spell
syn match    Statement    "^\(\(Private\|Public\) \)\=\(Sub\|Function\)"
syn match    Statement    "^End \(Sub\|Function\)$"
syn match    Statement    "^ \+Exit \(Sub\|Function\)$"
syn keyword  Todo         contained TODO FIXME
             "            "Above doesn't match if : is included
syn keyword  Boolean      True False
syn keyword  Constant     ThisWorkbook WorksheetFunction Nothing
syn keyword  Conditional  If Then ElseIf Else
syn match    Conditional  "End If"
syn keyword  Repeat       For Each In Next To Step GoTo While Wend
syn match    Repeat       "Exit For"
syn keyword  Operator     And Not Or Is
syn match    Operator     "[()+.,\-/*=&]"
syn match    Operator     "[<>]=\="
syn keyword  Type         Long String Double Boolean
syn match    Type         " Range"ms=s+1
syn keyword  Type         Worksheet
syn keyword  Type         Name Workbook Variant
syn keyword  Statement    Dim Const ReDim Set Enum Erase With
             \            Public Declare Function Private Optional
syn keyword  Statement    As
syn match    Statement    "Public Const"
syn match    Statement    "End With"
syn match    Statement    "End Enum"
syn match    Delimiter    " _$"
syn match    Number       "\<\d\+\.\d*\>"
syn region   String       start=+"+ end=+"\|$+ contains=@Spell
syn match    PreProc      "^Attribute VB_Name.*$"
syn match    PreProc      "^Option Explicit$"
syn keyword  Function     Intersect UBound LBound Chr Split IsEmpty
syn region   vbaFold1     start="^'[^ ]" end="^'[^ ]"me=s-1 fold keepend
             \            contains=Boolean,Comment,Conditional,Constant,
             \            Delimiter,Function,Number,Operator,PreProc,Repeat,
             \            Statement,String,Todo,Type,vbaFold2
syn region   vbaFold2     start="^ \{4\}'[^ ]"
             \            end="^\( \{4\}\)\='[^ ]"me=s-1 fold keepend
             \            contains=Boolean,Comment,Conditional,Constant,
             \            Delimiter,Function,Number,Operator,PreProc,Repeat,
             \            Statement,String,Todo,Type
