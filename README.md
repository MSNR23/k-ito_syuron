#卒論・修論・（博論？）テンプレート
もともと研究室サーバーにあったものをutf8にすべて変換したもの
##LaTeXのインストール方法
[研究室のWikiを参照](http://mizuuchi.lab.tuat.ac.jp/pukiwiki/index.php?%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%28programming%29%2FLaTeX)

##使い方
- このレポジトリをフォークする
- 編集すべきファイル
	- main.tex 
	- introduction.tex
- 追加すべきファイル
	- 他の章の.texファイル 
	- 図のファイル

- .texファイルを追加（hoge.tex）したら，main.texに\include{hoge}を追加．

図のファイルを別ディレクトリで管理する場合，main.texの上で定義されている\FIGDIRを使うのが便利．

- Makefileでmakeする場合
```bash
$ make pdf
```
を実行してPDｆファイルを作成

- latexmkを用いる場合
```bash
$ latexmk main.pdf
```
を実行してPDFファイルを作成

- latexmkでファイル更新時に自動コンパイル
```bash
$ latexmk -pvc main.tex
```
を実行すると，main.texに関係のあるファイルが更新されると勝手にPDFファイルも更新される

##Tips

卒論前刷りテンプレート

- 中間発表との違い
	- 英文アブストとキーワード
	- フォントサイズや行間の幅も違う？

- 基本的な使い方はテンプレートに従う．
- 各自の分量に合わせて\vspaceなどを使って適宜余白を調整する．

- 図表のキャプションは\captionではなく\smallcapを使った方が，バランスが良い．
