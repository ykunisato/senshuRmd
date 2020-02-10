#' R Markdown output formats Template for thesis at Department of Psychology, Senshu University
#' Format for thesis at Department of Psychology, Senshu University
#'
#' @export
senshu_thesis <- function(){
  template_tex_file <- system.file("rmarkdown/templates/thesis_senshu/resources/senshu.tex",
                             package = 'senshuRmd')
  format_pdf <- rmarkdown::pdf_document(latex_engine = "xelatex",
                                        template = template_tex_file,
                                        keep_tex = TRUE,
                                        toc = TRUE,
                                        toc_depth = 3,
                                        highlight = 'tango')
  format_pdf$inherits <- "pdf_document"
  format_pdf
}

#' Set Research Compendium of CCP Lab
#'
#' @param file_name file name and directory name of RMarkdown
#' @return Make directories for Research Compendium of CCP Lab and
#' R Markdown file for thesis at Department of Psychology, Senshu University
#' @examples # set_rc_ccp("yoshihiko_kunisato")
#' @export

set_rc_ccp <- function (file_name = "thesis"){
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
    writeLines("README about analysis", "analysis/README.md")
  }

  # make data directory
  if(!dir.exists(file.path(path, "data"))){
    dir.create(file.path(path, "data"), showWarnings = FALSE)
    file.create(file.path(path, "data/README_data.md"), showWarnings = FALSE)
    writeLines("README about data", "data/README.md")
  }

  # make function directory
  if(!dir.exists(file.path(path, "function"))){
    dir.create(file.path(path, "function"), showWarnings = FALSE)
    file.create(file.path(path, "function/README_function.md"), showWarnings = FALSE)
    writeLines("README about function", "function/README.md")
  }

  # make materials directory
  if(!dir.exists(file.path(path, "materials"))){
    dir.create(file.path(path, "materials"), showWarnings = FALSE)
    file.create(file.path(path, "materials/README_materials.md"), showWarnings = FALSE)
    writeLines("README about materials", "materials/README.md")
  }
}
