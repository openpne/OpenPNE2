<?php

class portal_page_edit_rss extends OpenPNE_Action
{
    // とりあえず、IDの最小値、最大値をここで定義
    var $min_portal_rss_id = 1;
    var $max_portal_rss_id = 5;

    function execute($requests)
    {
        $v = array();

        for ($i=$this->min_portal_rss_id;$i<=$this->max_portal_rss_id;$i++) {
            $portal_rss = db_portal_portal_rss($i);
            $v['portal_rss']['rss_'.$i] = $portal_rss['url'];
            $v['portal_rss']['rss_name_' . $i] = $portal_rss['name'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
