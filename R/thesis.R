#' R Markdown output formats Template for thesis at Department of Psychology, Senshu University
#' Format for thesis at Department of Psychology, Senshu University
#'
#' @importFrom rmarkdown render
#' @importFrom rmarkdown pdf_document
#' @importFrom jpaRmd jpa_cite
#' @param Rmd_file file name of R Markdown file
#' @param Bib_file file name of Bib file
#' @export
senshu_thesis  <- function(Rmd_file, Bib_file) {
  jpa_cite(Rmd_file, Bib_file)
  tmp_rmd <- paste0("tmp_", Rmd_file)
  template_tex_file <- system.file("rmarkdown/templates/thesis_senshu/resources/senshu.tex",
                                   package = 'senshuRmd')
  format_pdf <- pdf_document(
    latex_engine = "xelatex",
    template = template_tex_file,
    keep_tex = TRUE,
    toc = TRUE,
    toc_depth = 3,
    highlight = "tango"
  )
  format_pdf$inherits <- "pdf_document"
  output_file <- strsplit(Rmd_file, ".Rmd")[[1]]
  render(tmp_rmd, format_pdf, output_file)
}

#' Set Research Compendium of senshu
#' @return Make directories for Research Compendium of CCP Lab and
#' R Markdown file for thesis at Department of Psychology, Senshu University
#' @examples # set_rc()
#' @export
set_rc <- function (){
  path = getwd()
  # make README
  if(!file.exists(file.path(path, "README.md"))){
    file.create(file.path(path, "README.md"), showWarnings = FALSE)
    writeLines("## README\n\n- analysis:\n- data:\n- function:\n- materials:", "README.md")
  }

  # make RMarkdown file and directory
  rmarkdown::draft("paper.Rmd", template = "thesis_senshu", package = "senshuRmd", edit = FALSE)

  # make analysis directory
  if(!dir.exists(file.path(path, "analysis"))){
    dir.create(file.path(path, "analysis"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/README_analysis.md"), showWarnings = FALSE)
    writeLines("README about analysis", "analysis/README_analysis.md")
  }

  # make data directory
  if(!dir.exists(file.path(path, "analysis/data"))){
    dir.create(file.path(path, "analysis/data"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/data/README_data.md"), showWarnings = FALSE)
    writeLines("README about data", "analysis/data/README_data.md")
  }

  # make function directory
  if(!dir.exists(file.path(path, "analysis/function"))){
    dir.create(file.path(path, "analysis/function"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/function/README_function.md"), showWarnings = FALSE)
    writeLines("README about function", "analysis/function/README_function.md")
  }

  # make materials directory
  if(!dir.exists(file.path(path, "materials"))){
    dir.create(file.path(path, "materials"), showWarnings = FALSE)
    file.create(file.path(path, "materials/README_materials.md"), showWarnings = FALSE)
    writeLines("README about materials", "materials/README_materials.md")
  }

  # make labnote directory
  if(!dir.exists(file.path(path, "labnote"))){
    dir.create(file.path(path, "labnote"), showWarnings = FALSE)
    file.create(file.path(path, "labnote/README_labnote.md"), showWarnings = FALSE)
    writeLines("README about labnote", "materials/README_labnote.md")
  }
}


#' Set Research Compendium of CCP Lab
#'
#' @param file_name file name and directory name of RMarkdown
#' @return Make directories for Research Compendium of CCP Lab and
#' R Markdown file for thesis at Department of Psychology, Senshu University
#' @examples # set_rc_ccp()
#' @export
set_rc_ccp <- function (file_name = "paper"){
  path = getwd()
  # make README
  if(!file.exists(file.path(path, "README.md"))){
    file.create(file.path(path, "README.md"), showWarnings = FALSE)
    writeLines("## README\n\n- analysis:\n- data:\n- function:\n- materials:", "README.md")
  }

  # make RMarkdown file and directory
  if(!file.exists(file.path(path, paste0(file_name,".Rmd")))){
    rmarkdown::draft(paste0(file_name,".Rmd"), template = "thesis_senshu", package = "senshuRmd", edit = FALSE)
  }
  # make analysis directory
  if(!dir.exists(file.path(path, "analysis"))){
    dir.create(file.path(path, "analysis"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/README_analysis.md"), showWarnings = FALSE)
    writeLines("README(analysis)\n\n
    \u89e3\u6790\u306b\u4f7f\u3046R\u3084Rmd\u30d5\u30a1\u30a4\u30eb\u3092\u3053
    \u3053\u306b\u7f6e\u304d\u307e\u3059\u3002\n
    \u30d5\u30a1\u30a4\u30eb\u540d\u306f\u89e3\u6790\u306e\u9806\u756a\u304c\u308f
    \u304b\u308b\u3088\u3046\u306b\u3064\u3051\u3066\u304f\u3060\u3055\u3044\u3002\n
    Rmd\u30d5\u30a1\u30a4\u30eb\u306f\u89e3\u6790\u3068\u305d\u306e\u8aac\u660e
    \u3092\u307e\u3068\u3081\u3084\u3059\u3044\u306e\u3067\uff0c\u3067\u304d\u308b
    \u3060\u3051Rmd\u30d5\u30a1\u30a4\u30eb\u3092\u4f7f\u3046\u3088\u3046\u306b
    \u3057\u3066\u304f\u3060\u3055\u3044\u3002", "analysis/README_analysis.md")
  }

  # make data directory
  if(!dir.exists(file.path(path, "analysis/data"))){
    dir.create(file.path(path, "analysis/data"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/data/README_data.md"), showWarnings = FALSE)
    writeLines("README(data)\n\n
               ", "analysis/data/README_data.md")
  }

  # make function directory
  if(!dir.exists(file.path(path, "analysis/function"))){
    dir.create(file.path(path, "analysis/function"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/function/README_function.md"), showWarnings = FALSE)
    writeLines("README(function)\n\n
               ", "analysis/function/README_function.md")
  }

  # make materials directory
  if(!dir.exists(file.path(path, "materials"))){
    dir.create(file.path(path, "materials"), showWarnings = FALSE)
    file.create(file.path(path, "materials/README_materials.md"), showWarnings = FALSE)
    writeLines("README(materials)\n\n
               ", "materials/README_materials.md")
  }

  # make exercises directory
  if(!dir.exists(file.path(path, "exercises"))){
    dir.create(file.path(path, "exercises"), showWarnings = FALSE)
    file.create(file.path(path, "exercises/README_exercises.md"), showWarnings = FALSE)
    writeLines("README(exercises)\n\n
               ", "exercises/README_exercises.md")
  }

  # make labnote directory
  if(!dir.exists(file.path(path, "labnote"))){
    dir.create(file.path(path, "labnote"), showWarnings = FALSE)
    file.create(file.path(path, "labnote/README_labnote.md"), showWarnings = FALSE)
    writeLines("README(labnote)\n\n
               ", "materials/README_labnote.md")
  }
}
