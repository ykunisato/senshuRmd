#' @title Set template files for CBAT
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @param task_name name of task
#' @param jsPsych_version If you set a specific version number of jsPsych,
#'                set_jsPsych prepare a file with that version of jsPsych.
#' @param use_rc If you don"t use the RC, set FALSE.
#' @examples # set_cbat("stroop")
#' @export
set_cbat <- function(task_name = "task_name",
                     jsPsych_version = "7.1.2",
                     use_rc = TRUE){
  #check exercises directory
  if(use_rc == TRUE){
    dir_names_cwd =  basename(list.dirs())
    if(sum(dir_names_cwd == "exercises") >= 1){
      path = paste0(getwd(),"/exercises")
      dir.create(file.path(path, task_name), showWarnings = FALSE)
      path = paste0(path,"/",task_name)
    }else{
      stop(paste("Error! Run the code in the directory where the 'exercises' directory is located."))
    }
  }else{
    path = getwd()
    dir.create(file.path(path, task_name), showWarnings = FALSE)
    path = paste0(path,"/",task_name)
  }
  # prepare the files and directories
  if(jsPsych_version == "6.3.1"){
    ## make demo-.html file
    tmp_html <- file(file.path(path, paste0("demo_",task_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-text.js"></script>'), tmp_html)
    writeLines(paste0('  <link rel="stylesheet" href="',task_name,'/jspsych-',jsPsych_version,'/css/jspsych.css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/demo_fullscreen.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/demo_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make -.html file
    tmp_html <- file(file.path(path, paste0(task_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych-',jsPsych_version,'/plugins/jspsych-survey-text.js"></script>'), tmp_html)
    writeLines('  <script src="jatos.js"></script>', tmp_html)
    writeLines(paste0('  <link rel="stylesheet" href="',task_name,'/jspsych-',jsPsych_version,'/css/jspsych.css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/jatos_fullscreen.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/jatos_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make directory of repository
    dir.create(file.path(path, task_name), showWarnings = FALSE)
    ## download jsPsych
    temp_jsPsych <- tempfile()
    download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/v',jsPsych_version,'/jspsych-',jsPsych_version,'.zip'),temp_jsPsych)
    unzip(temp_jsPsych, exdir = file.path(path, task_name))
    unlink(temp_jsPsych)
    ## download js files
    file_path <- paste0(path,"/",task_name)
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/task.js",paste0(file_path,"/task.js"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/jatos_run.js",paste0(file_path,"/jatos_run.js"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/jatos_fullscreen.js",paste0(file_path,"/jatos_fullscreen.js"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/demo_run.js",paste0(file_path,"/demo_run.js"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/demo_fullscreen.js",paste0(file_path,"/demo_fullscreen.js"))
    ## make stimli directory and picture
    dir.create(file.path(file_path, "stimuli"), showWarnings = FALSE)
    stim_path <- paste0(file_path,"/stimuli")
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/reward.jpeg",paste0(stim_path,"/reward.jpeg"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/punishment.jpeg",paste0(stim_path,"/punishment.jpeg"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/s1.jpeg",paste0(stim_path,"/s1.jpeg"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/s1s.jpeg",paste0(stim_path,"/s1s.jpeg"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/s2.jpeg",paste0(stim_path,"/s2.jpeg"))
    download.file("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych6.3/name_of_repository/stimuli/s2s.jpeg",paste0(stim_path,"/s2s.jpeg"))
  }else if(substr(jsPsych_version, 1, 1)=="7"){
    ## make demo-.html file
    tmp_html <- file(file.path(path, paste0("demo_",task_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-text.js"></script>'), tmp_html)
    writeLines(paste0('  <link href="',task_name,'/jspsych/dist/jspsych.css" rel="stylesheet" type="text/css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/demo_jspsych_init.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/demo_jspsych_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make -.html file
    tmp_html <- file(file.path(path, paste0(task_name,".html")), "w")
    writeLines("<!DOCTYPE html>", tmp_html)
    writeLines("<html>", tmp_html)
    writeLines(" <head>", tmp_html)
    writeLines('  <meta charset="UTF-8" />', tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/jspsych.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-fullscreen.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-html-keyboard-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-html-button-response.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-likert.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-multi-choice.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-multi-select.js"></script>'), tmp_html)
    writeLines(paste0('  <script src="',task_name,'/jspsych/dist/plugin-survey-text.js"></script>'), tmp_html)
    writeLines('  <script src="jatos.js"></script>', tmp_html)
    writeLines(paste0('  <link href="',task_name,'/jspsych/dist/jspsych.css" rel="stylesheet" type="text/css" />'), tmp_html)
    writeLines(" </head>", tmp_html)
    writeLines(" <body></body>", tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/jatos_jspsych_init.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/task.js"></script>'), tmp_html)
    writeLines(paste0(' <script type="text/javascript" src="',task_name,'/jatos_jspsych_run.js"></script>'), tmp_html)
    writeLines("</html>", tmp_html)
    close(tmp_html)
    ## make directory of repository
    dir.create(file.path(path, task_name), showWarnings = FALSE)
    ## download jsPsych
    temp_jsPsych <- tempfile()
    if(jsPsych_version=="7.0.0"){
      download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/jspsych@7.0.0/jspsych-7.0.0-dist.zip'),temp_jsPsych)
    }else{
      download.file(paste0('https://github.com/jspsych/jsPsych/releases/download/jspsych@',jsPsych_version,'/jspsych.zip'),temp_jsPsych)
    }
    unzip(temp_jsPsych, exdir = file.path(path, task_name,"jspsych"))
    unlink(temp_jsPsych)
    ## download js files
    file_path <- paste0(path,"/",task_name)
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/task.js"),paste0(file_path,"/task.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/demo_jspsych_init.js"),paste0(file_path,"/demo_jspsych_init.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/demo_jspsych_run.js"),paste0(file_path,"/demo_jspsych_run.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/jatos_jspsych_init.js"),paste0(file_path,"/jatos_jspsych_init.js"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/jatos_jspsych_run.js"),paste0(file_path,"/jatos_jspsych_run.js"))
    ## make stimli directory and picture
    dir.create(file.path(file_path, "stimuli"), showWarnings = FALSE)
    stim_path <- paste0(file_path,"/stimuli")
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/reward.jpeg"),paste0(stim_path,"/reward.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/punishment.jpeg"),paste0(stim_path,"/punishment.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s1.jpeg"),paste0(stim_path,"/s1.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s1s.jpeg"),paste0(stim_path,"/s1s.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s2.jpeg"),paste0(stim_path,"/s2.jpeg"))
    download.file(paste0("https://raw.githubusercontent.com/ykunisato/template-jsPsych-task/main/template-jsPsych",substr(jsPsych_version, 1, 3),"/name_of_repository/stimuli/s2s.jpeg"),paste0(stim_path,"/s2s.jpeg"))
  }
}
