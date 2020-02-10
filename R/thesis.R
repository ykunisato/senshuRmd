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
  if(missing(file_name)){
    file_name <- "thesis"
  }
  path = getwd()

  # make README
  if(!file.exists(file.path(path, "README.md"))){
    file.create(file.path(path, "README.md"), showWarnings = TRUE)
    writeLines("こちらにはこのフォルダ全体に関する説明を書きます。\n\n- analysis: 解析で使用したRMarkdonwファイルをここにおきます。\n- data: 研究で使うデータをここにおきます。\n- function: analysisフォルダ内のRMarkdownに記載するには煩雑なR関数をここにおきます。\n- materials: 研究で用いた材料をここにおきます。", "README.md")
  }

  # make RMarkdown file and directory
  if(!file.exists(file.path(path, paste0(file_name,".Rmd")))){
    rmarkdown::draft(paste0(file_name,".Rmd"), template = "thesis_senshu", package = "senshuRmd", edit = FALSE)
  }
  # make analysis directory
  if(!dir.exists(file.path(path, "analysis"))){
    dir.create(file.path(path, "analysis"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/README.md"), showWarnings = TRUE)
    writeLines("analysisフォルダには，解析に関するRMarkdownファイルを置きます。各ファイルの説明をこのREADMEに書いてください。", "analysis/README.md")
  }

  # make data directory
  if(!dir.exists(file.path(path, "data"))){
    dir.create(file.path(path, "data"), showWarnings = FALSE)
    file.create(file.path(path, "data/README.md"), showWarnings = TRUE)
    writeLines("dataフォルダには，dataのファイルを置きます。各ファイルの説明をこのREADMEに書いてください。", "data/README.md")
  }

  # make function directory
  if(!dir.exists(file.path(path, "function"))){
    dir.create(file.path(path, "function"), showWarnings = FALSE)
    file.create(file.path(path, "function/README.md"), showWarnings = TRUE)
    writeLines("functionフォルダには，analysisフォルダのRMarkdownファイルに書くには煩雑なRの関数を定義するファイルをおきます。各ファイルの説明をこのREADMEに書いてください。", "function/README.md")
  }

  # make materials directory
  if(!dir.exists(file.path(path, "materials"))){
    dir.create(file.path(path, "materials"), showWarnings = FALSE)
    file.create(file.path(path, "materials/README.md"), showWarnings = TRUE)
    writeLines("materialsフォルダには，行動実験課題や調査票などの研究で用いた材料を全て置きます。フォルダごとに整理して，各ファイルやフォルダの説明をこのREADMEに書いてください。", "materials/README.md")
  }
}
