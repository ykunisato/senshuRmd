# senshuRmd

<!-- badges: start -->
<!-- badges: end -->

senshuRmdは，専修大学人間科学部心理学科での卒業論文・修士論文作成にあたり，有用なR関数やRmarkdownテンプレートがまとまったRパッケージです。大きく分けると，以下の３種類になります。

- 卒業論文・修士論文作成用Rmarkdownテンプレート:
- [jsPsych](https://www.jspsych.org)用関数とRmarkdownテンプレート:
- 電子ラボノート:gtihub, OSFに電子的にラボノートをアップする関数

使用にあたり，tinytexが必要です。tinytexについては，[こちら](https://yihui.org/tinytex/)をご確認ください。なお，日本語の場合，IPAexフォントが必要なので，tinytexのインストール後，`tinytex::tlmgr_install(‘ipaex’)`
でインストールください。

## インストール

以下のコマンドをRコンソールに打ち込んで，Github経由でインストールしてください。

``` r
# install.packages("remotes")
remotes::install_github("ykunisato/senshuRmd")
```

## 使用法

### 研究室用Research Compendiumの準備

#### 1.新規プロジェクトの作成

RStudioで新規プロジェクトを作成します(GitHubを使う場合は，version
controlで作成)。

#### 2.新規プロジェクトフォルダ内にResearch Compendiumを作成

set\_rc()で，研究室用Research
CompendiumのためのフォルダとREADMEファイルの作成と卒論・修論用RMarkdownのフォルダとファイルが作成されます。

``` r
library(senshuRmd)
set_rc()
```

以下のようなフォルダ構成です。

-   paper:卒論・修論用のRmdファイルが用意されています。
-   analysis：解析用ファイルを入れる用のフォルダです。
-   (analysis内) data：解析用データを入れるフォルダです。
-   (analysis内) function：解析用Rの関数を入れるフォルダです。
-   materials：研究で使った材料を入れるフォルダです。
-   labnote：ラボノートを保管するフォルダです。


最初に開かれたREADME.mdに,日々の研究活動で使用する便利な関数について説明していますので，ご確認ください。

#### 計算論的臨床心理学研究室（国里研究室）のゼミ生向け関数

計算論的臨床心理学研究室（国里研究室）のゼミ生は，演習をしたりするので，set\_rc\_cpp()で，Research
Compendiumを作成ください。

``` r
library(senshuRmd)
set_rc_ccp()
```

以下のようなフォルダ構成です。

-   paper:卒論・修論用のRmdファイルが用意されています。
-   analysis：解析用ファイルを入れる用のフォルダです。
-   (analysis内) data：解析用データを入れるフォルダです。
-   (analysis内) function：解析用Rの関数を入れるフォルダです。
-   materials：研究で使った材料を入れるフォルダです。
-   exercises：ゼミで行う演習課題用のフォルダです。
-   labnote：ラボノートを保管するフォルダです。

最初に開かれたREADME.mdに,日々の研究活動で使用する便利な関数について説明していますので，ご確認ください。

### 卒論・修論用RMarkdownの準備

上記のように，研究室用Research
Compendiumは不要で，卒論・修論用RMarkdownだけがほしい場合は，RStudioで，「File」
-&gt; 「New File」 -&gt; 「R Markdown…」
をクリックする。以下の画面がでてきたら，「From Template」から「Thesis
format for Senshu
{senshuRmd}」を選んで，OKをクリックする。これで，卒論・修論用RMarkdownが準備されます。

## 引用文献に関する注意事項

このRmdテンプレートでは，[jpaRmd](https://github.com/ykunisato/jpaRmd)のjpa\_cite()関数を使って引用をしています。引用文献情報をいれたbibファイルを作っておけば，簡単な指定で文献が綺麗に引用されるようになります。bibファイルの作成方法は，[kosugittiの記事](https://qiita.com/kosugitti/items/63140ead7942d4e9b1d7)をご確認ください。


### 電子ラボノートを作る

elnjp_pdf()で日付のついた電子ラボノート用Rmdファイルが作成されます。これをknitするとPDFファイルが出力されます（markdownを出力したい場合は，elnjp_md()もありますが，こちらはOSFへのアップロードには対応していません）。

``` r
eln4Rmd::elnjp_pdf()
```

例えば，研究した日に記録するのを忘れていて記入忘れをしている場合は，replace_dayで日付を指定できます。以下の場合は，2021-04-01に指定しています。また，分かりやすいようにファイル名に名前を足すこともadd_nameでできます。以下の場合は，april_fool_expを指定しています。結果として，"2021-04-01_april_fool_exp.Rmd"という名前のファイルができます。

``` r
eln4Rmd::elnjp_pdf(add_name = "april_fool_exp" , replace_day = "2021-04-01")
```

作成したラボノートにはタイムスタンプが必要です。タイムスタンプをつけないと，その日（もしくは後日に）に記録したのかの保証ができないので，電子ラボノートとして機能させる場合は，以下のようにOSFもしくはGitHubと連携をさせてください。

### osfと連携させる方法

#### (1) OSFのPAT(Personal Access Token)の登録

- OSF(https://osf.io)のアカウントを作って，OSFのPAT(Personal Access Token)を以下のsettingsページで作成します。"Create Token"をクリックして，"Token name"に適当な名前を英語でつけます。Scopesのところのチェックボックスにチェックをいれます。出てきた英数字の文字列をコピーします。なお，これはOSFへのアクセスを許可するトークンですので，パスワードなどと同様に厳重に保管をしてください（パスワード管理ソフトの使用を推奨します）。

https://osf.io/settings/tokens

- 上記のOSFのPAT(Personal Access Token)を.Renvironに登録します。以下のようにusethisパッケージを使うと.Renvironがなければ作成した開いてくれます。

``` r
library(usethis)
edit_r_environ()
```

- 以下を開いた.Renvironに貼り付けます。そして，"＜ご自身のOSFのPATに差し替えください＞"の部分を，上記で作成したOSFのPATに差し替えます。

```
OSF_PAT=＜ご自身のOSFのPATに差し替えください＞
```

- PATの登録を機能させるために，以下のコードでRを再起動します。

``` r
.rs.restartR()
```

#### (2) OSFのプロジェクトページを作成して，ラボノートを置くコンポーネントを作る

- ブラウザからOSFでプロジェクトを作成します。
- Labnoteなどの名前でコンポーネントを作ります。そして，そのコンポーネントをクリックして，そのURLをコピーしておきます(次で使います)。

#### (3) ラボノートの内容を書いてknitして，OSFにアップする。

- 電子ラボノートは以下の関数で作れます。内容を書いて，knitすれば，PDF形式で出力されます。

``` r
eln4Rmd::elnjp_pdf()
```

- 作成したPDFを確認してから，(2)で調べたOSFでのURLをいれて，以下の関数を実行するとOSFにアップロードされます（OSFに上でタイムスタンプが押されます）。

``` r
eln4Rmd::up_elnjp_osf(eln_osf = "OSFのラボノート用コンポーネントのURL")
```

さらに，OSFのラボノートコンポーネントにラボノートをアップするのと同時に，Research Compendiumの内容のバックアップをOSFにとりたい場合は，OSFにResearch Compendium用のコンポーネントを作成して，そのURLを使って以下のように実行します。なお，以下を実行する場合は，Research Compendiumをカレントディレクトリに指定して，そのサブディレクトリにlabnoteフォルダが存在することが前提になります。

``` r
eln4Rmd::up_elnjp_osf(eln_osf = "OSFのラボノート用コンポーネントのURL", rc_osf = "OSFのResearch Compendium用コンポーネントのURL")
```

- 一度(1)と(2)の設定ができていれば，あとは，毎日(3)を行うだけです（関数としては２回実行するだけ）。
- なお，elnjp_pdf()で，add_nameやreplace_dayを指定している場合は，up_elnjp_osf()でも同様の指定をしてください。


### GitHubと連携させる方法


#### (1) GitHubアカウントとリポジトリの作成する

- GitHubアカウントを作成します。作成方法の解説は多いので，読みやすいものを参考に作成ください。
- ラボノートをアップする用のGitHubリポジトリを作成ください。最初から公開することはないと思うので，プライベートリポジトリで作成ください。
- 以下を参考にして，GitHubのPersonal Access Token(PAT)を作成します。PATはパスワードと同じ情報なので，厳重に管理ください。

https://docs.github.com/ja/github/authenticating-to-github/creating-a-personal-access-token


#### (2) RStudioでユーザー名，メールアドレス，PATを登録する

- Rstudio上で，use_git_config()を使って，ユーザー名とメールアドレスを登録してください。

``` r
usethis::use_git_config(user.name = "Taro Yamada", user.email = "tyamada@example.com")
```

- Rstudio上で，gitcreds_set()を使って，PATを登録してください。"? Enter password or token: "と聞かれるので，上記のPATを貼り付けます。

``` r
gitcreds::gitcreds_set()
```

#### (3) ラボノートの内容を書いてknitして，GitHubにアップ（コミット＆プッシュ）する

- 電子ラボノートは以下の関数で作れます。内容を書いて，knitすれば，PDF形式で出力されます。

``` r
eln4Rmd::elnjp_pdf()
```

- 作成したPDFを確認してから，以下の関数を実行するとPDFという名前のフォルダを作ってそこにPDFをを保存したうえ，コミットをした上で，GitHubにプッシュしてくれます(GitHubにタイムスタンプが残ります）。

``` r
eln4Rmd::up_elnjp_git()
```
- 一度(1)と(2)の設定ができていれば，あとは，毎日(3)を行うだけです（関数としては２回実行するだけ）。
- なお，elnjp_pdf()で，add_nameやreplace_dayを指定している場合は，up_elnjp_git()でも同様の指定をしてください。

## 使い方

jsPsychRmd::set_jsPsych(folder = FALSE, jsPsych_version = "6.3.1", psychophysics_version = FALSE, exclude_smartphone = FALSE, pavlovia = FALSE, rc = FALSE)は，以下の引数を持ちます。下の例も参考にしつつご利用ください。

- folder: folder = "stroop"のように名前を指定すると，名前をつけたフォルダを作って，そこに各種ファイルを配置します。デフォルトはFALSEなので，指定しなければ，カレントディレクトリーにファイルが置かれます（folerを指定して，フォルダを整理することを推奨します）。
- jsPsych_version:  デフォルトはjsPsychの6.3.1になっていますが，別のバージョン番号を指定すれば，それがダウンロードされ，Rmdファイルの設定も変わります。
- psychophysics_version: デフォルトはFALSEですが，TRUEにすると，九州大学の黒木先生の[jspsych-psychophysics](https://jspsychophysics.hes.kyushu-u.ac.jp/)の2.3.2がダウンロードされ，Rmdファイルの設定も変わります。別のバージョン番号を指定すれば，それがダウンロードされ，Rmdファイルの設定も変わります。
- exclude_smartphone: デフォルトはFALSEですが，TRUEにすると，スマートフォンからのアクセスの場合に警告メッセージを出して終了する設定をするかどうかをコードがRmdファイルの設定に追加されます。
- pavlovia: デフォルトはFALSEですが，TRUEにすると，Pavloviaで実験をする時に使えるコードがRmdファイルの設定に追加されます。
- rc: デフォルトはFALSEですが，TRUEにすると，[senshuRmd](https://github.com/ykunisato/senshuRmd )で作るResearch Compendium内のexercisesフォルダ内にjsPsychのフォルダ・ファイルを用意します。

### 1.フォルダ名を指定して，そのフォルダ内にRMarkdownとjsPsychで行動課題を作る場合

以下のように，folderに名前を指定すると，指定した名前でフォルダを作って（以下だとstroop），そのフォルダ内に，Rmdファイル(index.Rmdという名前になります)，刺激をいれるstimuliフォルダ（READMEファイルが入っています），jspsych-6.3.1が配置されます。まずは，Rmdファイルを開いて，Knitを押すと，「こんにちは！」が表示されるHTMLファイルが作られます。後は，各種jsPsychのチュートリアルに従ってコードなどを追加していけば，課題が作れます。

```
jsPsychRmd::set_jsPsych(folder = "stroop")
```


以下のようにすると，jsPsychのバージョンを変えることができますし(6.3.1 → 6.3.0)，九州大学の黒木先生の[jspsych-psychophysics](https://jspsychophysics.hes.kyushu-u.ac.jp/)も追加されます。

```
jsPsychRmd::set_jsPsych(folder = "stroop", jsPsych_version = "6.3.0", psychophysics_version = TRUE)
```


### 2.Research Compendiumのexercises内にRMarkdownとjsPsychで行動課題を作る場合


以下のようにすると，[senshuRmd](https://github.com/ykunisato/senshuRmd )で作るResearch Compendium内のexercisesフォルダ内に  jsPsychの課題用フォルダを作って，Rmdファイル(index.Rmdという名前になります)，刺激をいれるstimuliフォルダ（READMEファイルが入っています），jspsych-6.3.1が配置されます。Rmdファイルを開いて，Knitを押すと，「こんにちは！」が表示されるHTMLファイルが作られます。後は，各種jsPsychのチュートリアルに従ってコードなどを追加していけば，課題が作れます。

```
jsPsychRmd::set_jsPsych(folder = "task", rc = TRUE)
```

### 3.スマートフォンを使った場合に警告メッセージを出す場合

山形大学の小林正法先生の解説（https://www.notion.so/OS-5fc2cf5bc43c4af99bb0a9ee22d8fc7d ）を参考に,参加者がスマートフォンからアクセスしているかどうかの判別と警告メッセージの出すコードを追加したRmdファイルを作成しました。以下のように，exclude_smartphone = TRUEとしていただくと，自動的にスマートフォン使用の判別と警告メッセージを出すコードが追加されたRmdが用意されます。

```
jsPsychRmd::set_jsPsych(folder = "task", exclude_smartphone = TRUE)
```

### 4.用意したフォルダ内にRMarkdownとjsPsychで行動課題を作る場合

folder = "task"でフォルダを新規作成するのではなく，既にあるフォルダ内にファイルを配置したいこともあります。その場合は，以下を実行します(引数の指定は不要です)。用意したフォルダ内に，Rmdファイル(index.Rmdという名前になります)，刺激をいれるstimuliフォルダ（READMEファイルが入っています），jspsych-6.3.1が配置されます。

```
jsPsychRmd::set_jsPsych()
```


### 5.RMarkdownとjsPsychで行動課題を作って，pavloviaで実施する場合

RMarkdownとjsPsychで課題を作ってpavloviaで実施する場合，[pavlovia.orgの解説](https://pavlovia.org/docs/experiments/create-jsPsych)を参考に，Pavlovia's GitLab repositoryに新しいプロジェクトを作って，ご自身のRStudioで，File→New Project→Version ControlからGitプロジェクトを作ります（Version Controlでご自身のPavlovia's GitLab repositoryの設定情報を入れてください）。その上で，以下を実行してもらうと，そのプロジェクト内に，pavloviaに対応した配置のライブラリとRmdファイルを用意します。あとは課題を作って完成させて，pavloviaにアップしたら実行できます（課題の作成時はコメントアウトしているpavloviaとの連携に関する部分のコメントアウトを外す必要はあります）。

```
jsPsychRmd::set_jsPsych(pavlovia = TRUE)
```

