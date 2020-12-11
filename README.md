
<!-- README.md is generated from README.Rmd. Please edit that file -->

# senshuRmd

<!-- badges: start -->

<!-- badges: end -->

senshuRmdは，専修大学人間科学部心理学科での卒業論文・修士論文をRmarkdownで作成するためのRパッケージです。

使用にあたり，tinytexが必要です。tinytexについては，[こちら](https://yihui.org/tinytex/)をご確認ください。

なお，日本語の場合，IPAexフォントが必要なので，tinytexのインストール後，`tinytex::tlmgr_install(‘ipaex’)`
でインストールください。

## インストール

以下のコマンドをRコンソールに打ち込んで，Github経由でインストールしてください。

    # install.packages("remotes")
    remotes::install_github("ykunisato/senshuRmd")

## 使用法

### 研究室用Research Compendiumの準備

#### 1.新規プロジェクトの作成

RStudioで新規プロジェクトを作成します(GitHubを使う場合は，version controlで作成)。

#### 2.新規プロジェクトフォルダ内で以下を実行します。

set\_rc\_ccp()内に，卒論や修論用Rmarkdownに付けたい名前をいれます（ローマ字で，名前\_姓が無難かと思います）。そうすると，研究室用Research
CompendiumのためのフォルダとREADMEファイルの作成と卒論・修論用RMarkdownのフォルダとファイルを作成します。

    library(senshuRmd)
    set_rc_ccp("yoshihiko_kunisato")

以下のような感じのフォルダ構成になります。

![](https://ykunisato.github.io/senshuRmd/fig1.png)

ご自身が名前を付けたフォルダに卒論や修論用Rmarkdownがはいっていますので，そちらを開いて，Knitをしてみてください。卒論・修論フォーマットのPDFが出力されるかと思います。

### 卒論・修論用RMarkdownの準備

上記のように，研究室用Research
Compendiumは不要で，卒論・修論用RMarkdownだけがほしい場合は，RStudioで，「File」
-\> 「New File」 -\> 「R Markdown…」 をクリックする。以下の画面がでてきたら，「From
Template」から「Thesis format for Senshu
{senshuRmd}」を選んで，OKをクリックする。これで，卒論・修論用RMarkdownが準備されます。

![](https://ykunisato.github.io/senshuRmd//fig2.png)

## 引用文献に関する注意事項

このRmdテンプレートでは，[jpaRmd](https://github.com/ykunisato/jpaRmd)のjpa\_cite()関数を使って引用をしています。引用文献情報をいれたbibファイルを作っておけば，簡単な指定で文献が綺麗に引用されるようになります。bibファイルの作成方法は，[kosugittiの記事](https://qiita.com/kosugitti/items/63140ead7942d4e9b1d7)をご確認ください。
