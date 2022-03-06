#' @title Set template files for CBAT
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @param name_repository Set name of GitHub repository
#' @param jsPsych_version If you set a specific version number of jsPsych,
#'                set_jsPsych prepare a file with that version of jsPsych.
#' @examples # set_cbat("stroop")
#' @export
set_cbat <- function (name_repository = "name_repository",
                      jsPsych_version = "6.3.1"){
  path = getwd()
  # make demo-.html file
  tmp_html <- file(file.path(path, paste0("demo_",name_repository,".html")), "w")
  writeLines("<!DOCTYPE html>", tmp_html)
  writeLines("<html>", tmp_html)
  writeLines(" <head>", tmp_html)
  writeLines('  <meta charset="UTF-8" />', tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/jspsych.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-fullscreen.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-keyboard-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-likert.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-choice.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-select.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-text.js"></script>'), tmp_html)
  writeLines(paste0('  <link rel="stylesheet" href="',name_repository,'/jspsych-',jsPsych_version,'/css/jspsych.css" />'), tmp_html)
  writeLines(" </head>", tmp_html)
  writeLines(" <body></body>", tmp_html)
  writeLines(paste0(' <script type="text/javascript" src="',name_repository,'/task.js"></script>'), tmp_html)
  writeLines(paste0(' <script type="text/javascript" src="',name_repository,'/task_jspsych_init.js"></script>'), tmp_html)
  writeLines("</html>", tmp_html)
  close(tmp_html)

  # make -.html file
  tmp_html <- file(file.path(path, paste0(name_repository,".html")), "w")
  writeLines("<!DOCTYPE html>", tmp_html)
  writeLines("<html>", tmp_html)
  writeLines(" <head>", tmp_html)
  writeLines('  <meta charset="UTF-8" />', tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/jspsych.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-fullscreen.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-keyboard-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-likert.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-choice.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-select.js"></script>'), tmp_html)
  writeLines(paste0('  <script src="',name_repository,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-text.js"></script>'), tmp_html)
  writeLines('  <script src="jatos.js"></script>', tmp_html)
  writeLines(paste0('  <link rel="stylesheet" href="',name_repository,'/jspsych-',jsPsych_version,'/css/jspsych.css" />'), tmp_html)
  writeLines(" </head>", tmp_html)
  writeLines(" <body></body>", tmp_html)
  writeLines(paste0(' <script type="text/javascript" src="',name_repository,'/task.js"></script>'), tmp_html)
  writeLines(paste0(' <script type="text/javascript" src="',name_repository,'/jatos_jspsych_init.js"></script>'), tmp_html)
  writeLines("</html>", tmp_html)
  close(tmp_html)

  # make directory of repository
  dir.create(file.path(path, name_repository), showWarnings = FALSE)

  # download jsPsych
  temp_jsPsych <- tempfile()
  download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/v',jsPsych_version,'/jspsych-',jsPsych_version,'.zip'),temp_jsPsych)
  unzip(temp_jsPsych, exdir = file.path(path, name_repository))
  unlink(temp_jsPsych)

  # download js files
  setwd(name_repository)
  download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/name_of_repository/jatos_jspsych_init.js","jatos_jspsych_init.js")
  download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/name_of_repository/task.js","task.js")
  download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/name_of_repository/task_jspsych_init.js","task_jspsych_init.js")

  # make stimli directory and picture
  dir.create("stimuli", showWarnings = FALSE)
  setwd("stimuli")
  download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/name_of_repository/stimuli/reward.jpeg","reward.jpeg")
}
