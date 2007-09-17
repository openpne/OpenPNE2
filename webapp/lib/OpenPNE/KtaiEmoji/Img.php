<?php

/**
 * 絵文字を画像に変換するためのクラス
 */
class OpenPNE_KtaiEmoji_Img extends OpenPNE_KtaiEmoji_Common
{
    function OpenPNE_KtaiEmoji_Img()
    {
        $this->emoji_image_dir = 'skin/default/img/emoji/';
        $this->emoji_image_extension = '.gif';
    }
    
    function &getInstance()
    {
        static $singleton;
        if (empty($singleton)) {
            $singleton = new OpenPNE_KtaiEmoji_Img();
        }
        return $singleton;
    }

    /**
     * 絵文字IDを画像表示用タグにして返す
     * 
     * @param string $emoji_code_id 絵文字ID
     * @return string 画像表示用タグ
     */
    function get_emoji4emoji_code_id($emoji_code_id)
    {
        $carrier_id = $emoji_code_id{0};
        $emoji_code_id = str_replace(':', '', $emoji_code_id);
        $emoji_path = OPENPNE_URL . $this->emoji_image_dir . $carrier_id .'/' . $emoji_code_id . $this->emoji_image_extension;

        $str = '<img src="' . $emoji_path . '" alt="絵文字：' . $emoji_code_id . '">';

        return $str;
    }
}
    
?>
