(TeX-add-style-hook
 "macros"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "english") ("biblatex" "backend=biber" "style=numeric" "maxnames=10") ("cleveref" "capitalize")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "enumerate"
    "amssymb"
    "amsthm"
    "amsmath"
    "amsfonts"
    "mathrsfs"
    "mathtools"
    "stmaryrd"
    "babel"
    "csquotes"
    "graphicx"
    "float"
    "tikz"
    "tikz-cd"
    "subcaption"
    "microtype"
    "physics"
    "biblatex"
    "hyperref"
    "cleveref")
   (TeX-add-symbols
    '("attrSetC" ["argument"] 0)
    '("ot" ["argument"] 0)
    '("define" 1)
    '("strucCospan" 1)
    '("structCspC" 2)
    '("cSetC" 1)
    '("graphC" 1)
    '("decGraphC" 1)
    '("linRelC" 1)
    '("vecC" 1)
    '("modC" 1)
    '("cat" 1)
    '("category" 1)
    '("numberset" 1)
    '("set" 1)
    '("mc" 1)
    "sq"
    "onto"
    "inc"
    "into"
    "oto"
    "tto"
    "maps"
    "oftype"
    "st"
    "sm"
    "ins"
    "sni"
    "inj"
    "complex"
    "rational"
    "integer"
    "ffield"
    "setC"
    "finSetC"
    "sSetC"
    "topC"
    "relC"
    "finRelC"
    "convC"
    "thermC"
    "grpC"
    "abC"
    "catC"
    "oprdC"
    "SMC"
    "measC"
    "Open"
    "petriC"
    "acsetC"
    "terminalC"
    "intervalC"
    "Ent"
    "cospan"
    "Hom"
    "Mor"
    "End"
    "ob"
    "dom"
    "codom"
    "el"
    "Lan"
    "Ran"
    "tensor"
    "evalat"
    "cmp"
    "limas"
    "colim")
   (LaTeX-add-environments
    '("exercise" LaTeX-env-args ["argument"] 0)
    '("exercise" 1))
   (LaTeX-add-amsthm-newtheorems
    "theorem"
    "proposition"
    "corollary"
    "lemma"
    "conjecture"
    "construction"
    "definition"
    "exerciseinner"
    "remark"
    "example"))
 :latex)

