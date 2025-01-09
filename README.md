# Fancyhdr/Extramarks version V5.x

This is the ongoing development version of the fancyhdr package.
It has been released as V5.x (for some x or x.y)

The code has been through all the tests I have, so in that sense it can
be considered reliable. But the release is quite young, so it hasn't
been thoroughly tested ‘in the field’.

New features in this version:

- New command `\fancyfootalign`
- New command `\fancyhdrbox`
- New command `\fancypagestyleassign`
- New commands `\fancyheadwidth`, `\fancyfootwidth` and `\fancyhfwidth`

`\fancypagestyle` has a starred version:
  `\fancypagestyle*{newstyle}[basestyle]{definitions}`
  
This works like the unstarred version, but it picks up all relevant
fields/values from the point where it is defined. This includes:
 - The header and footer fields in all variants (EO,LRC,HF), total 12.
 - The header and footer field widths in all variants (EO,LRC,HF), total 12.
 - The header and footer offsets (EO,LR,HF), total 8.
 - The header and footer init values (2).
 - `\headrule`, `\headrulewidth`, `\footrule`, `\footrulewidth`
 - The value of the [nocheck] option
 
 `\fancyhdrsettoheight{lengthvar}{H-OR-F}`
 where H-OR-F is one of the values oddhead, evenhead, oddfoot, evenfoot.
 This calculates the height of the specifies header or footer with the
 current fancyhdr definitions and assigns the value to the lengthvar.
 This should be used after fancyhdr has been setup, and after `\begin{document}`,
 for example in `\AtBeginDocument`. It can for example be used to set `\headheight`
 or `\footskip` but also other variables.
 
 Example:
 ```
\AtBeginDocument{%
  \fancyhdrsettoheight{\headheight}{oddhead}
}
```
In this way `\headheigth` is set to a value that prevents fancyhdrs's warning messages.
If the odd and the even header have different heights, the tallest one should
be used in the example above. Or the maximum should be calculated.

## Extramarks.sty

This implementation of extramarks.sty is completely new. It has independent marks and some new commands. The old version is in extramarks-v4.sty. See the documentation for more details.

The marks in the original extramarks package are tied to the normal marks
and to each other; they are not independent. This may cause unwanted effects
and therefore certain problems, like really independent marks for
sections and subsections, are not possible with extramarks.
On the other hand, the marks in the new version are really independent, and can
be set separately. Also they don't influence each other. See below for an example.

There are also new commands:

```
\extramarksleft{Some text}
\extramarksright{Some text}
```

These set the marks, independently. In fact the \extramarks command is redefined
to call these, `\extramarksleft` with its first argument, and `\extramarksright`
with the second one.

This implementation uses the new marks mechanism in the LaTeX kernel. See The LaTeX Companion, Third edition, pp. 390 ff.

In fact, with this new mechanism, extramarks.sty isn't that useful anymore, just for legacy use. For new documents it is recommended to use the new LaTeX marks directly.

The predefined marks are called 'extramarks-left' and 'extramarks-right', and the new commands
`\extramarksleft` and `\extramarksright` are just shorthands for
`\InsertMark{extramarks-left}` and `\InsertMark{extramarks-right}`.

```
\firstleftxmark
\firstrightxmark
\topleftxmark
\toprightxmark
\lastleftxmark
\lastrightxmark
\firstleftmark
\lastrightmark 
```

These are the same commands as in the original version, but with the new implementation.

Example: we want to have the first section title of a page in the left header,
and the first subsection title in the right header:

```
\usepackage{fancyhdr}
\usepackage{extramarks}

\pagestyle{fancy}
\fancyhead[L]{\firstleftxmark}  % section
\fancyhead[R]{\firstrightxmark}  % subsection

\renewcommand{\sectionmark}[1]{%
  \extramarksleft{\thesection. #1}%
}
\renewcommand{\subsectionmark}[1]{%
  \extramarksright{\thesubsection. #1}%
}
```
