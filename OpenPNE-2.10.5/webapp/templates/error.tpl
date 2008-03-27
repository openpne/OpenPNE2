<html>
<head>
<title>({if defined('SNS_NAME')})({$smarty.const.SNS_NAME})({else})ページが表示できませんでした({/if})</title>
</head>
<body>
({if $errors})({*デバッグ用エラー画面*})
<p>エラーが発生しました。</p>
<ul>
({foreach from=$errors item=item})
<li>({$item})</li>
({/foreach})
</ul>

({else})({*本番用*})

({if $notfound})
({*NotFound*})
<p>ページが見つかりません。</p>
({else})
({*メンテナンス画面*})
<p>
({if $smarty.const.OPENPNE_MAINTENANCE_TEXT})
({$smarty.const.OPENPNE_MAINTENANCE_TEXT|smarty:nodefaults})
({else})
現在、サーバが混み合っているか、メンテナンス中です。<br>
ご迷惑をおかけいたしますが、しばらく時間を空けて再度アクセスしてください。
({/if})
</p>
({/if})

({/if})

<p>({if defined('SNS_NAME')})({$smarty.const.SNS_NAME})<br>({/if})
<a href="({$smarty.const.OPENPNE_URL})">({$smarty.const.OPENPNE_URL})</a></p>
</body>
</html>
