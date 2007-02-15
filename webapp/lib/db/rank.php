<?php

//ポイントからランクを取得
function db_point_get_rank4point($point)
{
    $sql = "SELECT * FROM c_rank WHERE point <= ? ORDER BY point DESC";
    $params = array(intval($point));
    return db_get_row($sql, $params);
}

?>
