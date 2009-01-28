<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'XML/Serializer.php'; 
require_once OPENPNE_WEBAPP_DIR . '/modules/kanshi/lib/kanshi.php';

class kanshi_do_change extends OpenPNE_Action
{
    function handleError($errors, $code = 0, $requests = array())
    {
        if(strcmp($code, 1) == 0) { //パラメータ不足
            $message = '必須パラメータが不足しています';
        }
        elseif(empty($code) || strcmp($code, 99) == 0) { //その他
            $message = 'パラメータの値が正しくありません';
        }

        $data    = array(
            'meta' => array(
                'watch_type_id'        => $requests['watch_type_id'],
                'api_version'          => $requests['api_version'],
                'result'               => '0',
                'error_code'           => $code,
                'error_message'        => $message
            ),
            'entities' => '',
        );

        $options = array(
            "defaultTagName" => "entity",
            "rootName"       => "root",
        );

        $serializer = new XML_Serializer($options);
        $serializer->serialize($data);
        $result = $serializer->getSerializedData();

        header("Content-Type: text/xml; charset=utf-8");
        echo $result;
        exit;
    }

    function execute($requests)
    {
        $entity_number        = $requests['entity_number'];
        $api_version          = $requests['api_version'];
        $watch_type_id        = $requests['watch_type_id'];


        $errors = array();
        $code   = 0;
        if(empty($entity_number) || empty($api_version) || empty($watch_type_id)) {
            $this->handleError($errors, 1, $requests);
            exit;
        }


        $update_list = array(); // display更新リスト（実質削除リスト）

        // 日記【日記型】
        if(strcmp($watch_type_id, 1) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_diary_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']    = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq'] = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_diary4update_list($update_list);
        }
        // 掲示板・イベント【日記型】
        elseif(strcmp($watch_type_id, 2) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_commu_topic_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']          = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq']       = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_topic_event4update_list($update_list);
        }
        // コミュニティ【日記型】
        elseif(strcmp($watch_type_id, 3) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_commu_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']    = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq'] = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_community4update_list($update_list);
        }
        // 日記コメント【コメント型】
        elseif(strcmp($watch_type_id, 4) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_diary_comment_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']            = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq']         = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_diary_comment4update_list($update_list);
        }
        // 掲示板・イベントコメント【コメント型】
        elseif(strcmp($watch_type_id, 5) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_commu_topic_comment_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']                  = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq']               = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_topic_event_comment4update_list($update_list);
        }
        // 【画像型】（URL+タイトル）
        elseif(strcmp($watch_type_id, 7) == 0) {
            for($i=1; $i<=$entity_number; $i++){
                $update_list[$i]['c_image_id'] = intval($_REQUEST['data_id_' . $i]);
                $update_list[$i]['display']    = intval($_REQUEST['display_' . $i]);
                $update_list[$i]['import_seq'] = intval($_REQUEST['import_seq_' . $i]);
            }
            $result_list = kanshi_update_image4update_list($update_list);
        }
        else{
            $this->handleError($errors, 99, $requests);
            exit;
        }

        $data    = array(
            'meta' => array(
                'watch_type_id'        => $watch_type_id,
                'api_version'          => $api_version,
                'import_data_type_seq' => $import_data_type_seq,
                'result'               => '1'
            ),
            'entities' => $result_list
        );

        $options = array(
            "defaultTagName" => "entity",
            "rootName"       => "root",
        );

        $serializer = new XML_Serializer($options);
        $serializer->serialize($data); 
        $result = $serializer->getSerializedData();
        header("Content-Type: text/xml; charset=utf-8");
        echo $result;
    }
}

?>
