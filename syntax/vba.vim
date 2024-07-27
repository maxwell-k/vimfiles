" syntax/vba.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
"see :help group-name for a list of groups
"
syntax case match

syntax region   Comment      start="\(^\|\s\)\'" end="$" contains=Todo,@Spell
syntax match    Statement    "^\(\(Private\|Public\) \)\=\(Sub\|Function\)"
syntax match    Statement    "^End \(Sub\|Function\)$"
syntax match    Statement    "^ \+Exit \(Sub\|Function\)$"
syntax keyword  Todo         contained TODO FIXME
             "            "Above doesn't match if : is included
syntax keyword  Boolean      True False
syntax keyword  Constant     ThisWorkbook WorksheetFunction Nothing
syntax keyword  Conditional  If Then ElseIf Else
syntax match    Conditional  "End If"
syntax keyword  Repeat       For Each In Next To Step GoTo While Wend
syntax match    Repeat       "Exit For"
syntax keyword  Operator     And Not Or Is
syntax match    Operator     "[()+.,\-/*=&]"
syntax match    Operator     "[<>]=\="
syntax keyword  Type         Long String Double Boolean
syntax match    Type         " Range"ms=s+1
syntax keyword  Type         Worksheet
syntax keyword  Type         Name Workbook Variant
syntax keyword  Statement    Dim Const ReDim Set Enum Erase With
             \            Public Declare Function Private Optional
syntax keyword  Statement    As
syntax match    Statement    "Public Const"
syntax match    Statement    "End With"
syntax match    Statement    "End Enum"
syntax match    Delimiter    " _$"
syntax match    Number       "\<\d\+\.\d*\>"
syntax region   String       start=+"+ end=+"\|$+ contains=@Spell
syntax match    PreProc      "^Attribute VB_Name.*$"
syntax match    PreProc      "^Option Explicit$"
syntax keyword  Function     Intersect UBound LBound Chr Split IsEmpty
syntax region   vbaFold1     start="^'[^ ]" end="^'[^ ]"me=s-1 fold keepend
             \            contains=Boolean,Comment,Conditional,Constant,
             \            Delimiter,Function,Number,Operator,PreProc,Repeat,
             \            Statement,String,Todo,Type,vbaFold2
syntax region   vbaFold2     start="^ \{4\}'[^ ]"
             \            end="^\( \{4\}\)\='[^ ]"me=s-1 fold keepend
             \            contains=Boolean,Comment,Conditional,Constant,
             \            Delimiter,Function,Number,Operator,PreProc,Repeat,
             \            Statement,String,Todo,Type
