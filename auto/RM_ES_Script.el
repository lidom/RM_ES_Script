(TeX-add-style-hook
 "RM_ES_Script"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "book"
    "bk10"
    "amsmath"
    "amssymb"
    "lmodern"
    "iftex"
    "fontenc"
    "inputenc"
    "textcomp"
    "unicode-math"
    "upquote"
    "microtype"
    "parskip"
    "xcolor"
    "xurl"
    "bookmark"
    "hyperref"
    "color"
    "fancyvrb"
    "framed"
    "longtable"
    "booktabs"
    "array"
    "calc"
    "etoolbox"
    "footnotehyper"
    "footnote"
    "graphicx"
    "selnolig"
    "natbib"
    "amsthm")
   (TeX-add-symbols
    '("WarningTok" 1)
    '("VerbatimStringTok" 1)
    '("VariableTok" 1)
    '("StringTok" 1)
    '("SpecialStringTok" 1)
    '("SpecialCharTok" 1)
    '("RegionMarkerTok" 1)
    '("PreprocessorTok" 1)
    '("OtherTok" 1)
    '("OperatorTok" 1)
    '("NormalTok" 1)
    '("KeywordTok" 1)
    '("InformationTok" 1)
    '("ImportTok" 1)
    '("FunctionTok" 1)
    '("FloatTok" 1)
    '("ExtensionTok" 1)
    '("ErrorTok" 1)
    '("DocumentationTok" 1)
    '("DecValTok" 1)
    '("DataTypeTok" 1)
    '("ControlFlowTok" 1)
    '("ConstantTok" 1)
    '("CommentVarTok" 1)
    '("CommentTok" 1)
    '("CharTok" 1)
    '("BuiltInTok" 1)
    '("BaseNTok" 1)
    '("AttributeTok" 1)
    '("AnnotationTok" 1)
    '("AlertTok" 1)
    "VerbBar"
    "VERB"
    "tightlist"
    "maxwidth"
    "maxheight")
   (LaTeX-add-labels
    "preface"
    "topics"
    "introduction-to-r"
    "short-glossary"
    "first-steps"
    "further-data-objects"
    "simple-regression-analysis-using-r"
    "programming-in-r"
    "r-packages"
    "tidyverse"
    "tidyverse-plotting-basics"
    "tidyverse-data-wrangling-basics"
    "the-pipe-operator"
    "the-group_by-function"
    "further-links"
    "further-r-intros"
    "version-control-gitgithub"
    "r-ladies"
    "estimation-theory"
    "bias-variance-and-mse"
    "consistency-of-estimators"
    "rates-of-convergence"
    "asymptotic-distributions"
    "asymptotic-theory"
    "mathematical-tools"
    "taylor-expansions"
    "tools-for-deriving-asymptotic-distributions"
    "the-delta-method"
    "statistical-hypothesis-testing"
    "hypotheses-and-test-statistics"
    "significance-level-size-and-p-values"
    "fig:pvalueFig"
    "PF1"
    "asymptotic-null-distributions"
    "multiple-comparisons"
    "fig:unnamed-chunk-5"
    "r-lab-the-gauss-test"
    "fig:unnamed-chunk-10"
    "ordinary-least-squares-the-classical-linear-regression-model"
    "finite-sample-properties"
    "eq:c3e1"
    "eq:c3e2"
    "eq:c3e3"
    "eq:c3e4"
    "eq:c3e5"
    "eq:c3e6"
    "the-algebra-of-least-squares"
    "eq:c3e7"
    "some-quantities-of-interest"
    "eq:c3e8"
    "coefficient-of-determination"
    "partitioned-regression-model"
    "eq:c3e9"
    "eq:c3e10"
    "eq:c3e11"
    "eq:c3e12"
    "eq:c3e13"
    "eq:c3e14"
    "eq:c3e15"
    "finite-sample-properties-of-ols"
    "thm:GMT"
    "eq:c3e16"
    "eq:c3e17"
    "eq:c3e18"
    "thm:UBS"
    "Testing"
    "asymptotics-under-the-classic-regression-model"
    "monte-carlo-simulations"
    "checking-test-statistics"
    "simple-example-gauss-test"
    "simulated-power-function"
    "checking-parameter-estimators"
    "how-to-write"
    "five-common-writing-mistakes"
    "gregory-mankiw-how-to-write-well"
    "rob-j-hyndman-avoid-annoying-a-referee"
    "latex"
    "how-to-present"
    "the-aim-of-your-talk"
    "a-suggested-structure"
    "preparing-slides"
    "keeping-to-time"
    "giving-the-presentation"
    "final-advice")
   (LaTeX-add-environments
    "Shaded")
   (LaTeX-add-bibliographies
    "book.bib")
   (LaTeX-add-color-definecolors
    "shadecolor")
   (LaTeX-add-fancyvrb-environments
    '("Highlighting" "Verbatim"))
   (LaTeX-add-amsthm-newtheorems
    "theorem"
    "lemma"
    "corollary"
    "proposition"
    "conjecture"
    "definition"
    "example"
    "exercise"
    "hypothesis"
    "remark"
    "solution"))
 :latex)

