
<!-- README.md is generated from README.Rmd. Please edit that file -->

# senshuRmd

<!-- badges: start -->

<!-- badges: end -->

senshuRmdは，専修大学人間科学部心理学科での卒業論文・修士論文をRmarkdownで作成するためのRパッケージです。使用にあたり，tinytexが必要です。

## インストール

以下のコマンドをRコンソールに打ち込んで，Github経由でインストールしてください。

    # install.packages("devtools")
    devtools::install_github("ykunisato/senshuRmd")

## 使用法

githubリポジトリ

    library(senshuRmd)
    set_rc_ccp("yoshihiko_kunisato")

RStudioで，「File」 -\> 「New File」 -\> 「R Markdown…」
をクリックする。以下の画面がでてきたら，「From
Template」から「Thesis format for Senshu
{senshuRmd}」を選んで，OKをクリックする。

![](fig/fig1.png)

## 日本語引用文献に関する注意事項

このRmdテンプレートでは，apa-6th-edition.cslを使ってAPA形式で出力します。英語文献はいい感じですが，日本語文献は位置も引用形式もちょっとおかしい感じになっています。このRmdテンプレートでは，TeXファイルが出力されるので，その出力されたファイルをいじって最終調整をして，以下をコンソールに打ち込むといい感じになります。

``` r
library(tinytex)
xelatex('skeleton.tex')
```
