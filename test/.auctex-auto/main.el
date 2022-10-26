(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("amsart" "12pt" "reqno")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("xy" "all" "cmtip")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "amsart"
    "amsart12"
    "geometry"
    "inputenc"
    "xy"
    "macros")
   (TeX-add-symbols
    "Op"
    "Alg"
    "C"
    "D"
    "pos"
    "nonneg"
    "extreal"
    "convrelC"
    "finC"
    "thermrelC"
    "cspC"
    "Ssh"
    "Sbath"
    "Sgas"
    "Stank")
   (LaTeX-add-labels
    "sec:convex_spaces"
    "ex:simplex"
    "ex:extended_reals"
    "def:product_convex_spaces"
    "ex:graph_of_convex-linear"
    "def:composition_of_convex_relations"
    "sec:thermostatic_systems"
    "ex:ideal_gas"
    "fig:ideal_gas"
    "ex:tank"
    "ex:heat_bath"
    "ex:Shannon"
    "ex:measure_space"
    "ex:density_matrices"
    "ex:generalized"
    "sec:entropy_maximization"
    "thm:functor"
    "ex:infty"
    "ex:-infty"
    "sec:operads"
    "fig:little_2disks_composition"
    "con:smcoperad"
    "ex:operad_of_sets"
    "construction:operad_algebra"
    "thm:lax"
    "fig:two_gases_equalize_pressure"
    "thm:operad_algebra"
    "fig:two_ideal_gases"
    "ex:legendre"
    "ex:canonical_ensemble"
    "ex:grand_canonical_ensemble"
    "ex:microcanonical_ensemble")
   (LaTeX-add-environments
    '("exercise" LaTeX-env-args ["argument"] 0))
   (LaTeX-add-bibliographies))
 :latex)

