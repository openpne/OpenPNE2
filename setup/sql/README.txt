このディレクトリには、OpenPNEのセットアップに使用する各種SQLファイルが格納されています。

・MySQL のバージョン
・用途
により分類されて別ディレクトリに格納されているので、適切なファイルを選択してご使用ください。


■ MySQL のバージョン

・mysql41
    MySQL 4.1 以降（5.x を含む）用

・mysql40
    MySQL 4.0 用

・postgres74
    PostgreSQL 7.4 以降用


■ 用途
・install
   2.10.x の新規インストールに使用するSQLが格納されています。
   インストール手順の詳細に関しては、OpenPNE_Setup.html をご覧ください。

・upgrade
   安定版 2.8.x から 2.10.x へのアップグレードに使用するSQLが格納されています。
   アップグレード手順の詳細に関しては、OpenPNE_Upgrade.html をご覧ください。

・update
   開発版 2.9.x / 2.10alphaX から 2.10.x へのアップデートに使用するSQLが格納されています。

・option
   インストールには必須ではないSQLが格納されています。
   PNEBIZ モードを有効にした際に有用なSQLなどが格納されています。
   ※ただし、postgres74/option ディレクトリには、アップデートに必要なSQLが格納されています。
     詳細は postgres74/option/README.txt をご覧ください。