mazonのデータ変更に対応するスクリプトを格納しています。

■tool_review_update.php
  Amazonのデータに変更があった場合、DBのレビューデータ（c_review）を最新のAmazonデータに更新するスクリプトです。 

  実行方法：
   1. コマンドによる実行
    php tool_review_update.php

   2. cronによる実行
   tool_review_update.cron をcronにて定期的に実行

