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

#' Set Research Compendium of Department of Psychology, Senshu University
#' @importFrom rstudioapi navigateToFile
#' @examples # set_rc()
#' @export
set_rc <- function (){

}


#' Set Research Compendium of CCP Lab
#' @importFrom rstudioapi navigateToFile
#' @examples # set_rc_ccp()
#' @export
set_rc_ccp <- function (){
  path = getwd()
  # make README
  if(!file.exists(file.path(path, "README.md"))){
    file.create(file.path(path, "README.md"), showWarnings = FALSE)
    writeLines("## README\n\n- analysis(data\u3068function\u304c\u542b\u307e\u308c\u3066\u3044\u307e\u3059):\u89e3\u6790\u7528\u30d5\u30a9\u30eb\u30c0\n- materials:\u7814\u7a76\u6750\u6599\u30d5\u30a9\u30eb\u30c0\n- exercises:\u30bc\u30df\u3067\u306e\u6f14\u7fd2\u8ab2\u984c\u3092\u884c\u3046\u30d5\u30a9\u30eb\u30c0\n- labnote:\u30e9\u30dc\u30ce\u30fc\u30c8\u3092\u4fdd\u5b58\u3059\u308b\u30d5\u30a9\u30eb\u30c0\n", "README.md")
    navigateToFile(file.path(path, "README.md"))
  }

  # make paper.Rmd
  if(!file.exists(file.path(path, "paper/paper.Rmd"))){
    rmarkdown::draft(paste0("paper.Rmd"), template = "thesis_senshu", package = "senshuRmd", edit = FALSE)
    navigateToFile(file.path(path, "paper/paper.Rmd"))
  }

  # make analysis directory
  if(!dir.exists(file.path(path, "analysis"))){
    dir.create(file.path(path, "analysis"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/README_analysis.md"), showWarnings = FALSE)
    writeLines("README(analysis)\n\n\u89e3\u6790\u306b\u4f7f\u3046R\u3084Rmd\u30d5\u30a1\u30a4\u30eb\u3092\u3053\u3053\u306b\u7f6e\u304d\u307e\u3059\u3002\n\u30d5\u30a1\u30a4\u30eb\u540d\u306f\u89e3\u6790\u306e\u9806\u756a\u304c\u308f\u304b\u308b\u3088\u3046\u306b\u3064\u3051\u3066\u304f\u3060\u3055\u3044\u3002\nRmd\u30d5\u30a1\u30a4\u30eb\u306f\u89e3\u6790\u3068\u305d\u306e\u8aac\u660e\u3092\u307e\u3068\u3081\u3084\u3059\u3044\u306e\u3067\uff0c\u3067\u304d\u308b\u3060\u3051Rmd\u30d5\u30a1\u30a4\u30eb\u3092\u4f7f\u3046\u3088\u3046\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002", "analysis/README_analysis.md")
  }

  # make data directory
  if(!dir.exists(file.path(path, "analysis/data"))){
    dir.create(file.path(path, "analysis/data"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/data/README_data.md"), showWarnings = FALSE)
    writeLines("README(data)\n\n\u3053\u3061\u3089\u306b\u89e3\u6790\u3067\u4f7f\u3046\u30c7\u30fc\u30bf\u3092\u7f6e\u304d\u307e\u3059\u3002OSF\u3084GitHub\u306b\u304a\u3044\u3066\u3082\u5927\u4e08\u592b\u306a\u30c7\u30fc\u30bf\u5316\u3069\u3046\u304b\u306f\u6307\u5c0e\u6559\u54e1\u306b\u76f8\u8ac7\u3092\u3057\u3066\u304f\u3060\u3055\u3044\u3002", "analysis/data/README_data.md")
  }

  # make function directory
  if(!dir.exists(file.path(path, "analysis/function"))){
    dir.create(file.path(path, "analysis/function"), showWarnings = FALSE)
    file.create(file.path(path, "analysis/function/README_function.md"), showWarnings = FALSE)
    writeLines("README(function)\n\n\u3053\u3061\u3089\u306b\u89e3\u6790\u3067\u4f7f\u3046R\u95a2\u6570\u3092\u7f6e\u304d\u307e\u3059\u3002\u95a2\u6570\u5316\u3057\u305f\u3082\u306e\u306f\u5225\u306b\u307e\u3068\u3081\u3066\u304a\u3044\u305f\u307b\u3046\u304c\u4fbf\u5229\u306a\u306e\u3067\uff0c\u3053\u3061\u3089\u3092\u5229\u7528\u304f\u3060\u3055\u3044\u3002", "analysis/function/README_function.md")
  }

  # make materials directory
  if(!dir.exists(file.path(path, "materials"))){
    dir.create(file.path(path, "materials"), showWarnings = FALSE)
    file.create(file.path(path, "materials/README_materials.md"), showWarnings = FALSE)
    writeLines("README(materials)\n\n\u7814\u7a76\u3067\u4f7f\u7528\u3057\u305f\u6750\u6599\uff08\u5b9f\u9a13\u8ab2\u984c\uff0c\u8cea\u554f\u7d19\uff0c\u5b9f\u9a13\u30fb\u8abf\u67fb\u30d7\u30ed\u30c8\u30b3\u30eb\uff0c\u502b\u7406\u7533\u8acb\u66f8\uff09\u306a\u3069\u3092\u3053\u3061\u3089\u306b\u4fdd\u7ba1\u3057\u3066\u304f\u3060\u3055\u3044\u3002", "materials/README_materials.md")
  }

  # make exercises directory
  if(!dir.exists(file.path(path, "exercises"))){
    dir.create(file.path(path, "exercises"), showWarnings = FALSE)
    file.create(file.path(path, "exercises/README_exercises.r"), showWarnings = FALSE)
    writeLines("# README(exercises)\n\n\u56fd\u91cc\u7814\u7a76\u5ba4\u3067\u884c\u3046\u6f14\u7fd2\u8ab2\u984c\u306f\uff0c\u3053\u3061\u3089\u306b\u4fdd\u5b58\u3057\u3066\u304f\u3060\u3055\u3044\u3002\n\u4ee5\u4e0b\u3092\u5b9f\u884c\u3059\u308b\u3068exercises\u3092\u4f5c\u696d\u30d5\u30a9\u30eb\u30c0\u306b\u3067\u304d\u307e\u3059\u3002\r\nsetwd(\"exercises\")\nexercises\u3092\u4f5c\u696d\u30d5\u30a9\u30eb\u30c0\u306b\u3057\u305f\u3046\u3048\u3067\uff0c\u6f14\u7fd2\u8ab2\u984c\u306b\u53d6\u308a\u7d44\u3093\u3067\u304f\u3060\u3055\u3044\u3002", "exercises/README_exercises.r")
  }

  # make labnote directory
  if(!dir.exists(file.path(path, "labnote"))){
    dir.create(file.path(path, "labnote"), showWarnings = FALSE)
    file.create(file.path(path, "labnote/README_labnote.r"), showWarnings = FALSE)
    writeLines("# README(labnote)\n\n# \u96fb\u5b50\u30e9\u30dc\u30ce\u30fc\u30c8\u306f\u3053\u3061\u3089\u306b\u4fdd\u5b58\u3057\u3066\u304f\u3060\u3055\u3044\u3002\n# \u307e\u305a\uff0csetwd()\u3067labnote\u3092\u4f5c\u696d\u30d5\u30a9\u30eb\u30c0\u306b\u3057\u307e\u3059\u3002\nsetwd('labnote')\n# \u4ee5\u4e0b\u306eelnjp_pdf()\u3067\u30e9\u30dc\u30ce\u30fc\u30c8\u304c\u4f5c\u308c\u307e\u3059\u3002\neln4Rmd::elnjp_pdf()\n# \u4ee5\u4e0b\u306e\u30ea\u30f3\u30af\u5148\u3092\u307f\u3066\uff0cOSF\u304bGitHub\u306e\u8a2d\u5b9a\u3092\u3057\u307e\u3059\u3002\n# https://github.com/ykunisato/eln4Rmd\n#OSF\u3092\u4f7f\u3046\u5834\u5408\u306f\uff0c\u4ee5\u4e0b\u3067\u30a2\u30c3\u30d7\u30ed\u30fc\u30c9\u3057\u307e\u3059\u3002\neln4Rmd::up_elnjp_osf(osf=\"OSF\u306eURL\")\n# GitHub\u3092\u4f7f\u3046\u5834\u5408\u306f\uff0c\u4ee5\u4e0b\u3067\u30a2\u30c3\u30d7\u30ed\u30fc\u30c9\uff08\u30b3\u30df\u30c3\u30c8\u3068\u30d7\u30c3\u30b7\u30e5\uff09\u3057\u307e\u3059\u3002\neln4Rmd::up_elnjp_git()", "materials/README_labnote.r")
  }
}
