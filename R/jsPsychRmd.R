#' @title Set the Rmd file and directory for jsPsych
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom rmarkdown draft
#' @importFrom stringr str_detect
#' @importFrom rstudioapi navigateToFile
#' @param jsPsych_version If you set a specific version number of jsPsych,
#'                set_jsPsych prepare a file with that version of jsPsych.
#' @param psychophysics_version If you set version number, set_jsPsych prepare a file of jspsych-psychophysics(set FALSE in default)
#' @param folder If you set TRUE, set_jsPsych make directory that you set and put file in it(set FALSE in default)
#' @param exclude_smartphone If you set TRUE, set_jsPsych download the platform.js and set Rmd file(set FALSE in default)
#' @param pavlovia If you set TRUE, set_jsPsych set Rmd for conducting the task in Pavlova (set FALSE in default)
#' @param rc If you set name of folder of RC, set_jsPsych make directory of RC.
#' @examples # set_jsPsych("stroop")
#' @export
set_jsPsych <- function (folder = FALSE,
                         jsPsych_version = "6.3.1",
                         psychophysics_version = FALSE,
                         exclude_smartphone = FALSE,
                         pavlovia = FALSE,
                         rc = FALSE){
  tmp_wd <- getwd()
  if(rc != FALSE){
    if(rc == TRUE){
      tmp_wd <- paste0(tmp_wd,"/exercises")
    }else{
      tmp_wd <- paste0(tmp_wd,"/",rc)
    }
  }

  if(folder != FALSE){
    path = file.path(tmp_wd, folder)
    dir.create(path, showWarnings = FALSE)
  }else{
    path = tmp_wd
  }

  # make stimuli directory
  if(!dir.exists(file.path(path, "stimuli"))){
    dir.create(file.path(path, "stimuli"), showWarnings = FALSE)
    file.create(file.path(path, "stimuli/README_materials.md"), showWarnings = FALSE)
    writeLines("README about stimuli", file.path(path, "stimuli/README_materials.md"))
  }

  # make RMarkdown file and directory
  if(!file.exists(file.path(path, "index.Rmd"))){
    # set Rmd template file
    path_skeleton <- system.file("rmarkdown/templates/jsPsych/skeleton/skeleton.Rmd",package = "jsPsychRmd")
    text_skeleton <- readLines(path_skeleton, warn = F)
    tmp_rmd <- file(file.path(path, "index.Rmd"), "w")
    for (i in 1:length(text_skeleton)) {
      st <- text_skeleton[i]
      if(str_detect(st, pattern = "#00")){
        st <- paste0("    css: jspsych-",jsPsych_version,"/css/jspsych.css")
        writeLines(st, tmp_rmd)
      }else if(str_detect(st, pattern = "#01")){
        if(pavlovia == FALSE){
          st <- paste0("tags$script(src='jspsych-",jsPsych_version,"/jspsych.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#02")){
        if(pavlovia == FALSE){
          if(exclude_smartphone == TRUE){
            st <- paste0("tags$script(src='jspsych-",jsPsych_version,"/platform.js'),")
            writeLines(st, tmp_rmd)
          }
        }
      }else if(str_detect(st, pattern = "#03")){
        if(pavlovia == FALSE){
          if(psychophysics_version != FALSE){
            st <- paste0("tags$script(src='jspsych-psychophysics-",psychophysics_version,"/jspsych-psychophysics.js'),")
            writeLines(st, tmp_rmd)
          }
        }
      }else if(str_detect(st, pattern = "#04")){
        if(pavlovia == FALSE){
          st <- paste0("tags$script(src='jspsych-",jsPsych_version,"/plugins/jspsych-html-keyboard-response.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#05")){
        if(pavlovia == FALSE){
          st <- paste0("tags$script(src='jspsych-",jsPsych_version,"/plugins/jspsych-html-button-response.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#06")){
        if(pavlovia == FALSE){
          st <- paste0("tags$script(src='jspsych-",jsPsych_version,"/plugins/jspsych-fullscreen.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#07")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='jspsych-",jsPsych_version,"/jspsych.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#08")){
        if(pavlovia == TRUE){
          if(exclude_smartphone == TRUE){
            st <- paste0("tags$script(type='text/javascript', src='jspsych-",jsPsych_version,"/platform.js'),")
            writeLines(st, tmp_rmd)
          }
        }
      }else if(str_detect(st, pattern = "#09")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='lib/vendors/jquery-2.2.0.min.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#10")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='lib/jspsych-pavlovia-3.2.5.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#11")){
        if(pavlovia == TRUE){
          if(psychophysics_version != FALSE){
            st <- paste0("tags$script(type='text/javascript', src='jspsych-psychophysics-",psychophysics_version,"/jspsych-psychophysics.js'),")
            writeLines(st, tmp_rmd)
          }
        }
      }else if(str_detect(st, pattern = "#12")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='jspsych-",jsPsych_version,"/plugins/jspsych-html-keyboard-response.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#13")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='jspsych-",jsPsych_version,"/plugins/jspsych-html-button-response.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#14")){
        if(pavlovia == TRUE){
          st <- paste0("tags$script(type='text/javascript', src='jspsych-",jsPsych_version,"/plugins/jspsych-fullscreen.js'),")
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#15")){
        if(pavlovia == TRUE){
          st <- "/*pavlovia\u8a2d\u5b9a*/"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#16")){
        if(pavlovia == TRUE){
          st <- "var pavlovia_init = {"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#17")){
        if(pavlovia == TRUE){
          st <- "  type: 'pavlovia',"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#18")){
        if(pavlovia == TRUE){
          st <- "  command: 'init'"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#19")){
        if(pavlovia == TRUE){
          st <- "};"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#20")){
        if(pavlovia == TRUE){
          st <- "var pavlovia_finish = {"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#21")){
        if(pavlovia == TRUE){
          st <- "type: 'pavlovia',"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#22")){
        if(pavlovia == TRUE){
          st <- "command: 'finish'"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#23")){
        if(pavlovia == TRUE){
          st <- "};"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#24")){
        if(exclude_smartphone == TRUE){
          st <- "/*\u30b9\u30de\u30db\u8a2d\u5b9a*/"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#25")){
        if(exclude_smartphone == TRUE){
          st <- "var nameOs = platform.os.toString().toLowerCase();"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#26")){
        if(exclude_smartphone == TRUE){
          st <- "var welcome = {"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#27")){
        if(exclude_smartphone == TRUE){
          st <- "type: 'html-keyboard-response',"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#28")){
        if(exclude_smartphone == TRUE){
          st <- "stimulus: '\u3042\u306a\u305f\u306e\u4f7f\u3063\u3066\u3044\u308bOS\u306f\uff0c\u300c' + nameOs + '\u300d\u3067\u3059\u306d'"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#29")){
        if(exclude_smartphone == TRUE){
          st <- "};"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#30")){
        if(exclude_smartphone == TRUE){
          st <- "smartPhoneMessage = {"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#31")){
        if(exclude_smartphone == TRUE){
          st <- "type: 'html-keyboard-response',"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#32")){
        if(exclude_smartphone == TRUE){
          st <- "stimulus: '<strong>\u3053\u306e\u5b9f\u9a13\u306f\u30b9\u30de\u30fc\u30c8\u30d5\u30a9\u30f3\u3084\u30bf\u30d6\u30ec\u30c3\u30c8\u3067\u306f\u5b9f\u65bd\u3067\u304d\u307e\u305b\u3093\u3002\u5927\u5909\u7533\u3057\u8a33\u3054\u3056\u3044\u307e\u305b\u3093\u304c\uff0c\u30d1\u30bd\u30b3\u30f3\u3092\u4f7f\u3063\u3066\u5b9f\u65bd\u3092\u3057\u3066\u304f\u3060\u3055\u3044\u3002</strong>',"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#33")){
        if(exclude_smartphone == TRUE){
          st <- "trial_duration: 5000"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#34")){
        if(exclude_smartphone == TRUE){
          st <- "};"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#35")){
        if(pavlovia == TRUE){
          st <- "//timeline.push(pavlovia_init);"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#36")){
        if(exclude_smartphone == TRUE){
          st <- "/* \u30b9\u30de\u30db\u5bfe\u5fdc */"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#37")){
        if(exclude_smartphone == TRUE){
          st <- "if (nameOs.indexOf('ios') !== -1 | nameOs.indexOf('android') !== -1 ){"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#38")){
        if(exclude_smartphone == TRUE){
          st <- "timeline.push(smartPhoneMessage);"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#39")){
        if(exclude_smartphone == TRUE){
          st <- "}else{"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#40")){
        if(exclude_smartphone == TRUE){
          st <- "}"
          writeLines(st, tmp_rmd)
        }
      }else if(str_detect(st, pattern = "#41")){
        if(pavlovia == TRUE){
          st <- "//timeline.push(pavlovia_finish);"
          writeLines(st, tmp_rmd)
        }
      }else{
        writeLines(st, tmp_rmd)
      }
    }
    close(tmp_rmd)
    navigateToFile(file.path(path, "index.Rmd"))
  }

  # make jsPsych directory
  path_jsPsych <- file.path(path, paste0("jspsych-",jsPsych_version))
  if(!dir.exists(path_jsPsych)){
    temp <- tempfile()
    download.file(paste0("https://github.com/jspsych/jsPsych/releases/download/v",jsPsych_version,"/jspsych-",jsPsych_version,".zip"),temp)
    unzip(temp, exdir = paste0(path,"/"))
    unlink(temp)
    download.file('https://raw.githubusercontent.com/bestiejs/platform.js/master/platform.js', destfile = file.path(path_jsPsych,"platform.js"), method = "curl")
  }

  # make psychophysics directory
  if(psychophysics_version != FALSE){
    if(psychophysics_version == TRUE){
      psychophysics_version <- "2.3.2"
    }
    path_psychophysics <- file.path(path, paste0("jspsych-psychophysics-",psychophysics_version))
    if(!dir.exists(path_psychophysics)){
      temp2 <- tempfile()
      download.file(paste0("https://github.com/kurokida/jspsych-psychophysics/archive/refs/tags/v",psychophysics_version,".zip"),temp2)
      unzip(temp2, exdir = paste0(path,"/"))
      unlink(temp2)
    }
  }
}
