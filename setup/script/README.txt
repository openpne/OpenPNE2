このディレクトリには、バージョンアップに伴い必要となるコンバートを行うスクリプトを格納しています。

config.phpの設定を行ったのちにスクリプトを実行してください。

■update01-for2.9.3-easy_ktai_id.php
  DBに存在する個体識別番号の値をハッシュ化するスクリプトです。

実行方法：
  php update01-for2.9.3-easy_ktai_id.php


■option-covert_ktai_emoji.php
  各キャリアの絵文字画像をOpenPNEで表示できるファイル名にして保存するスクリプトです。

実行方法：
  php option-covert_ktai_emoji.php [carrier] [input] ([output])
    [carrier]  : どのキャリアの絵文字をコンバートするか
    [input]    : コンバート対象の絵文字が入ったディレクトリ
    [output]   : （オプション）コンバート後の絵文字を保存するディレクトリ（省略すると、[OPENPNE_PUBLIC_HTML_DIR]/skin//skin/default/img/emoji/）