# Fancyhdr version V4.1beta

This is the ongoing development version of the fancyhdr package.
It is not yet a stable release. Eventually it will be released as V4.1

The version number will remain V4.1beta, but the date will be updated if a new
version is made available.

The code has been through all the tests I have, so in that sense it can be
considered reliable. But before the release things can still change.

Most probably new features will be added before the release. But the new
features that have been added since the previous release could still be changed
or even disappear. Unless bugs are detected, the functionality that was present
in the previous release is not supposed to be changed.

The documentation is also not up to date. New features are not yet (fully)
documented, and the other documentation still has to be improved. However, the
existing documentation can generally be considered correct, although minor
flaws may be present.

New features in this beta version:

\fancypagestyle has a starred version:
  \fancypagestyle*{newstyle}[basestyle]{definitions}
  
This works like the unstarred version, but it picks up all relevant
fields/values from the point where it is defined. This includes:
 - The header and footer fields in all variants (EO,LRC,HF), total 12.
 - The header and footer offsets (EO,LR,HF), total 8.
 - The header and footer init values (2).
 - \headrule, \headrulewidth, \footrule, \footrulewidth
 - The value of the [nocheck] option
 
 \fancyhdrsettoheight{lengthvar}{H-OR-F}
 where H-OR-F is one of the values oddhead, evenhead, oddfoot, evenfoot.
 This calculates the height of the specifies header or footer with the
 current fancyhdr definitions and assigns the value to the lengthvar.
 This should be used after fancyhdr has been setup, and after \begin{document},
 for example in \AtBeginDocument. It can for example be used to set \headheight
 or \footskip but also other variables.
 
 Example:
 \AtBeginDocument{%
  \fancyhdrsettoheight{\headheight}{oddhead}
}
In this way \headheigth is set to a value that prevents fancyhdrs's warning messages.
If the odd and the even header have different heights, the tallest one should
be used in the example above. Or the maximum should be calculated.

## Extramarks.sty

This implementation of extramarks.sty is completely new. It has independent marks and several new commands. A preliminary version was earlier put here as extramarks2.sty. This is no longer the case, but it has been put in extramarks.sty. The old version is in extramarks-v3.sty. See the documentation for more details.

The marks in the original extramarks package are tied to the normal marks
and to each other; they are not independent. This may cause unwanted effects
and therefore certain problems, like really independent marks for
sections and subsections, are not possible with extramarks.
On the other hand, the marks in the new version are really independent, and can
be set separately. Also they don't influence each other. See below for an example.
Moreover, you can define your own marks for even more freedom.

There are also new commands:

\extramarksleft{Some text}
\extramarksright{Some text}

These set the marks, independently. In fact the \extramarks command is redefined
to call these, \extramarksleft with its first argument, and \extramarksright
with the second one.

Making new marks:

\extramarksnewmark{name} - Create a new mark 'name'
\extramarksput{name}{Some text} - Put some text in the mark 'name'

Get the marks (for use in headers/footers)

\extramarkstop{name}
\extramarksfirst{name}
\extramarkslast{name}

The predefined marks are called 'left' and 'right', and the new commands
\extramarksleft and \extramarksright are just shorthands for
\extramarksput{left} and \extramarksput{right}.

\firstleftxmark
\firstrightxmark
\topleftxmark
\toprightxmark
\lastleftxmark
\lastrightxmark
\firstleftmark
\lastrightmark 

These are the same commands as in the original version, but with a new implementation.

Example: we want to have the first section title of a page in the left header,
and the first subsection title in the right header:

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

