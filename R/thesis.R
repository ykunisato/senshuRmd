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
