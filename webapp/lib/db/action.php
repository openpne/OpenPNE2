<?php

function db_action_get_point4c_action_id($c_action_id)
{
    $sql = "SELECT point FROM c_action WHERE c_action_id = ?";
    $params = array(intval($c_action_id));
    return db_get_one($sql, $params);
}

?>
