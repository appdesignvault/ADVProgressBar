ADVProgressBar for iOS
======================

A custom progress bar that comes in multiple colors.
It shows a display above the bar that depicts the amount of the task that has
completed.
This indication may be displayed as the whole value or its percentage.

This work has been derived from https://github.com/appdesignvault/ADVProgressBar.

Changes relate to the following topics:
- Let configure the range of the values represented by the progress bar.
- Choose the way the amount of completed task is displayed: percentage or integral.
- Allow variable size.
- Add support to `initWithFrame` and `initWithCoder` so that the view controller
  can add `ADVProgressBar` via a nib (storyboard) or programatically.
- Annotate source code files an according to Doxygen in order to auto generate
 design documentation.


DOCUMENTATION
-------------

The design documentation can be found [here] (http://corerd.github.com/ADVProgressBar).

The Doxygen configuration file Doxyfile is also provided.
The Doxygen output html pages can be found under the **gh-pages** branch.
Otherwise, you can self generate them following these steps:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd /path/to/ADVProgressBar/DoxyDoc
doxygen Doxyfile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


CREDITS
-------

[ADVProgressBar on Cocoa Controls]
(http://www.cocoacontrols.com/controls/advprogressbar)

[How To Make a Custom UIView]
(http://www.raywenderlich.com/1768/how-to-make-a-custom-uiview-a-5-star-rating-view)


The MIT License
---------------

Original work Copyright (c) 2011 Tope Abayomi

Modified work Copyright (c) 2013 Corrado Ubezio

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


