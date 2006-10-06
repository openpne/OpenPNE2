管理画面(adminモジュール)を別ドメイン(URL)で運用することができます。

setup/admin/public_html 以下のファイル、ディレクトリを
管理画面用の公開ディレクトリにコピーし、
config.inc.php の内容を環境に合わせて書き換えてください。

SNSのユーザ画面と管理画面を別サーバで運用する場合は、
ユーザ画面用の設定ファイル(config.php)と同内容のファイルを
config.inc.php から読み込めるようにしてください。


[ディレクトリ構成例]

- OPENPNE_DIR
  ├ bin
  ├ lib
  ├ var
  ├ webapp
  ├ webapp_ext
  ├ webapp_biz
  └ config.php

(http://sns.example.com/)
- public_html (ディレクトリ名は変更可能)
  ├ config.inc.php (OPENPNE_DIR ディレクトリを指定)
  ├ index.php
     ...

(http://admin.example.com/)
- admin_public_html (ディレクトリ名は変更可能)
  ├ config.inc.php (OPENPNE_DIR ディレクトリを指定)
  ├ index.php
  ├ modules
  │ └ admin
  │     └ default.css
  └ skin
      └ dummy.gif


[URL例]

http://admin.example.com/?m=admin
{OPENPNE_ADMIN_URL}?m={ADMIN_MODULE_NAME}
