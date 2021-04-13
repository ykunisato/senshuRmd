# senshuRmd

<!-- badges: start -->
<!-- badges: end -->

senshuRmdは，専修大学人間科学部心理学科での卒業論文・修士論文をRmarkdownで作成するためのRパッケージです。

使用にあたり，tinytexが必要です。tinytexについては，[こちら](https://yihui.org/tinytex/)をご確認ください。

なお，日本語の場合，IPAexフォントが必要なので，tinytexのインストール後，`tinytex::tlmgr_install(‘ipaex’)`
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
