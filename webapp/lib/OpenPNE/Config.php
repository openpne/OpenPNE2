<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 設定項目の管理クラス
 */
class OpenPNE_Config
{
    var $allowed_names = array();

    /**
     * constructor
     * @access private
     */
    function OpenPNE_Config()
    {
        $this->allowed_names = array(
            'SNS_NAME', 'SNS_TITLE',
            'ADMIN_EMAIL', 'AMAZON_AFFID',
            'CATCH_COPY', 'OPERATION_COMPANY', 'COPYRIGHT',
            'IS_CLOSED_SNS', 'IS_USER_INVITE', 'IS_GET_EASY_ACCESS_ID',
            'OPENPNE_ENABLE_PC', 'OPENPNE_ENABLE_KTAI',
            'OPENPNE_REGIST_FROM',
            'LOGIN_CHECK_ENABLE','LOGIN_CHECK_TIME','LOGIN_CHECK_NUM','LOGIN_REJECT_TIME',
            'LOGIN_URL_PC', 'DISPLAY_LOGIN', 'LOGIN_URL_KTAI',
            'DISPLAY_SCHEDULE_HOME', 'DISPLAY_SEARCH_HOME', 'DAILY_NEWS_DAY',
            'USE_BOOKMARK_FEED', 'USE_SHINOBIASHI', 'USE_DIARY_CATEGORY',
            'OPENPNE_USE_CMD_TAG', 'OPENPNE_USE_FLASH_LIST',
            'WORD_FRIEND', 'WORD_FRIEND_HALF',
            'WORD_MY_FRIEND', 'WORD_MY_FRIEND_HALF',
            'WORD_DIARY', 'WORD_DIARY_HALF',
            'WORD_COMMUNITY', 'WORD_COMMUNITY_HALF',
            'WORD_NICKNAME', 'WORD_NICKNAME_HALF',
            'SORT_ORDER_NICK', 'SORT_ORDER_BIRTH',
            'OPENPNE_ENABLE_ROLLOVER',
            'OPENPNE_DISP_POINT', 'OPENPNE_DISP_RANK',
            'OPENPNE_IS_POINT_ADMIN',
            'AFFILIATE_TAG',
            'AFFILIATE_KTAI_TAG',
            'UNUSED_MAILS',
            'USE_EXTRA_SERVICE',
            'USE_BIZ_DIR',
            'SEND_USER_DATA',
            'LIMIT_DOMAIN1',
            'LIMIT_DOMAIN2',
            'LIMIT_DOMAIN3',
            'LIMIT_DOMAIN4',
            'LIMIT_DOMAIN5',
            'OPENPNE_USE_POINT_RANK',
            'OPENPNE_SKIN_THEME',
            'OPENPNE_USE_KTAI_LOGO',
            'OPENPNE_IS_SET_KTAI_FONT_SIZE',
            'OPENPNE_USE_RANKING',
            'OPENPNE_USE_DECORATION',
            'OPENPNE_USE_ALBUM',
            'OPENPNE_ALBUM_LIMIT',
            'OPENPNE_DISP_KTAI_SNS_PRIVACY',
            'DISPLAY_NEWDIARYTOPIC_HOME',
            'OPENPNE_USE_DIARY_COMMENT',
            'IS_SNS_ENTRY_CONFIRM',
            'OPENPNE_IMAGE_USER_LIMIT',
            'OPENPNE_IMAGE_DIARY_LIMIT',
            'OPENPNE_IMAGE_COMMU_LIMIT',
            'OPENPNE_IMAGE_OTHER_LIMIT',
            'USE_RESPONSE_COMMENT',
            'USE_MESSAGE_OPEN_UNOPEN',
        );
    }

    function &getInstance()
    {
        static $singleton;
        if (empty($singleton)) {
            $singleton = new OpenPNE_Config();
        }
        return $singleton;
    }

    function is_allowed($name)
    {
        return in_array($name, $this->allowed_names);
    }

    /**
     * c_admin_config から設定値を読み込み
     * ひとまず定数として定義
     */
    function db_load_config()
    {
        $sql = 'SELECT * FROM c_admin_config';
        $configs = db_get_all($sql);

        foreach ($configs as $config) {
            if (!$this->is_allowed($config['name'])) continue;

            defined($config['name']) or define($config['name'], $config['value']);
        }
    }

    /**
     * bind_default()
     *
     * @access public
     */
    function bind_default()
    {
        $defaults = array(
        // 管理画面
            'SNS_NAME' => 'MySNS',
            'SNS_TITLE' => '',
            'ADMIN_EMAIL' => 'sns@' . MAIL_SERVER_DOMAIN,
            'IS_CLOSED_SNS' => true,
            'IS_USER_INVITE' => true,
            'IS_GET_EASY_ACCESS_ID' => 1,
            'OPENPNE_ENABLE_PC' => true,
            'OPENPNE_ENABLE_KTAI' => true,
            'OPENPNE_REGIST_FROM' => 3,
            'AMAZON_AFFID'   => 'snsoftjp-22',
            'LOGIN_URL_PC' => '',
            'LOGIN_URL_KTAI' => '',
            'DISPLAY_LOGIN' => 1,
            'DISPLAY_SCHEDULE_HOME' => 1,
            'DISPLAY_SEARCH_HOME' => 1,
            'OPENPNE_USE_RANKING' => 1,
            'DAILY_NEWS_DAY' => '月,木',
            'USE_BOOKMARK_FEED' => false,
            'USE_SHINOBIASHI' => false,
            'USE_DIARY_CATEGORY' => true,
            'OPENPNE_USE_CMD_TAG' => true,
            'LOGIN_CHECK_ENABLE' => false,
            'LOGIN_CHECK_NUM' => 1000,
            'LOGIN_CHECK_TIME' => 6,
            'LOGIN_REJECT_TIME' => 30,
            'CATCH_COPY' => '',
            'OPERATION_COMPANY' => '',
            'COPYRIGHT' => '',
            'WORD_FRIEND' => 'フレンド',
            'WORD_FRIEND_HALF' => 'ﾌﾚﾝﾄﾞ',
            'WORD_MY_FRIEND' => 'マイフレンド',
            'WORD_MY_FRIEND_HALF' => 'ﾏｲﾌﾚﾝﾄﾞ',
            'WORD_DIARY' => '日記',
            'WORD_DIARY_HALF' => '日記',
            'WORD_COMMUNITY' => 'コミュニティ',
            'WORD_COMMUNITY_HALF' => 'ｺﾐｭﾆﾃｨ',
            'WORD_NICKNAME' => 'ニックネーム',
            'WORD_NICKNAME_HALF' => 'ﾆｯｸﾈｰﾑ',
            'SORT_ORDER_NICK'  => 0,
            'SORT_ORDER_BIRTH' => 0,
            'OPENPNE_USE_FLASH_LIST' => false,
            'OPENPNE_ENABLE_ROLLOVER' => true,
            'AFFILIATE_TAG' => '',
            'AFFILIATE_KTAI_TAG' => '',
            'UNUSED_MAILS' => '',
            'USE_EXTRA_SERVICE' => '1',
            'USE_BIZ_DIR' => '0',
            'SEND_USER_DATA' => '0',
            'LIMIT_DOMAIN1' => '',
            'LIMIT_DOMAIN2' => '',
            'LIMIT_DOMAIN3' => '',
            'LIMIT_DOMAIN4' => '',
            'LIMIT_DOMAIN5' => '',
            'OPENPNE_USE_POINT_RANK' => 0,
            'OPENPNE_DISP_POINT' => 1,
            'OPENPNE_DISP_RANK' => 1,
            'OPENPNE_IS_POINT_ADMIN' => 1,
            'OPENPNE_SKIN_THEME' => '005_openpne_blue',
            'OPENPNE_IS_SET_KTAI_FONT_SIZE' => 1,
            'OPENPNE_USE_DECORATION' => 1,
            'OPENPNE_USE_ALBUM' => 1,
            'OPENPNE_ALBUM_LIMIT' => 0,
            'OPENPNE_DISP_KTAI_SNS_PRIVACY' => 1,
            'DISPLAY_NEWDIARYTOPIC_HOME' => 0,
            'OPENPNE_USE_DIARY_COMMENT' => 0,
            'IS_SNS_ENTRY_CONFIRM' => 0,
            'OPENPNE_IMAGE_USER_LIMIT' => 0,
            'OPENPNE_IMAGE_DIARY_LIMIT' => 0,
            'OPENPNE_IMAGE_COMMU_LIMIT' => 0,
            'OPENPNE_IMAGE_OTHER_LIMIT' => 0,
            'USE_RESPONSE_COMMENT' => 0,
            'USE_MESSAGE_OPEN_UNOPEN' => 0,
        // config.php
            'OPENPNE_RSS_CACHE_DIR' => OPENPNE_VAR_DIR . '/rss_cache',
            'OPENPNE_PUBLIC_HTML_DIR' => OPENPNE_DIR . '/public_html',
            'OPENPNE_UNDER_MAINTENANCE' => false,
            'OPENPNE_DEBUGGING' => false,
            'OPENPNE_TRIM_DOUBLEBYTE_SPACE' => true,
            'OPENPNE_USE_API' => false,
            'SESSION_STORAGE' => 0,
            'OPENPNE_TMP_IMAGE_DB' => false,
            'OPENPNE_TMP_FILE_DB' => false,
            'OPENPNE_USE_PARTIAL_SSL' => false,
            'OPENPNE_USE_SSL_PARAM' => false,
            'OPENPNE_IMG_URL' => '',
            'OPENPNE_IMG_CACHE_PUBLIC' => false,
            'OPENPNE_IMG_CACHE_PREFIX' => 'img_cache_',
            'IMAGE_MAX_FILESIZE' => 300,
            'IMAGE_MAX_WIDTH' => 0,
            'IMAGE_MAX_HEIGHT' => 0,
            'OPENPNE_USE_FILEUPLOAD' => false,
            'FILE_MAX_FILESIZE' => 300,
            'FILE_ALLOWED_EXTENTIONS' => '',
            'MAIL_ADDRESS_PREFIX' => '',
            'MAIL_ADDRESS_HASHED' => true,
            'MAIL_ADDRESS_HASH_LENGTH' => 12,
            'MAIL_HAN2ZEN' => true,
            'MAIL_HEADER_SEP' => 'LF',
            'MAIL_FROM_ENCODING' => 'auto',
            'MAIL_WRAP_WIDTH' => 200,
            'MAIL_SET_ENVFROM' => true,
            'MAIL_ENVFROM' => '',
            'LOG_C_ACCESS_LOG' => false,
            'OPENPNE_ADMIN_URL' => '',
            'ADMIN_MODULE_NAME' => 'admin',
            'SERVER_IP_KEY' => 'REMOTE_ADDR',
            'OPENPNE_USE_FUNCTION_CACHE' => false,
            'OPENPNE_USE_MYSQL_HINT' => false,
            'OPENPNE_USE_OLD_CRYPT_BLOWFISH' => false,
            'OPENPNE_SESSION_CHECK_URL' => false,
            'OPENPNE_SESSION_CHECK_PC_USER_AGENT' => false,
            'OPENPNE_SESSION_CHECK_KTAI_USER_AGENT' => true,
            'OPENPNE_ONE_SESSION_PER_USER' => false,
            'OPENPNE_DASHBOARD_URL' => 'http://ad.pne.jp/dashboard/',
            'OPENPNE_AUTH_MODE' => 'email',
            'IS_SLAVEPNE_EMAIL_REGIST' => true,
            'SLAVEPNE_SYOUTAI_URL_PC' => '',
            'SLAVEPNE_SYOUTAI_URL_KTAI' => '',
            'SLAVEPNE_PASSWORD_QUERY_URL_PC' => '',
            'SLAVEPNE_PASSWORD_QUERY_URL_KTAI' => '',
            'OPENPNE_IMG_KTAI_MAX_WIDTH' => 240,
            'OPENPNE_IMG_KTAI_MAX_HEIGHT' => 320,
            'OPENPNE_MAINTENANCE_TEXT' => '',
            'CHECK_KTAI_IP' => false,
            'OPENPNE_WEATHER_URL' => 'http://weather.yahoo.co.jp/weather/',
            'OPENPNE_USE_KTAI_LOGO' => true,
            'OPENPNE_USE_FUNCTION_CACHE_MEMCACHE' => false,
            'OPENPNE_LOG_FUNCTION' => '',
            'OPENPNE_EMOJI_DOCOMO_FOR_PC' => true,
            'OPENPNE_USE_HTTP_PROXY' => false,
            'OPENPNE_HTTP_PROXY_HOST' => 'proxy.example.com',
            'OPENPNE_HTTP_PROXY_PORT' => 8080,
            'OPENPNE_SEND_NO_CACHE_HEADER' => false,
            'OPENPNE_ADMIN_CONVERT_URL' => true,
            'CHECK_IMG_AUTH' => false,
            'OPENPNE_IS_OPENID_SERVER' => false,
            'OPENPNE_DB_ERROR_LOG' => true,
            'IS_PASSWORD_QUERY_ANSWER' => 2,
            'OPENPNE_POST_INTERVAL_UNFAIR_SECOND' => 10,
            'OPENPNE_POST_INTERVAL_UNFAIR_COUNT' => 10,
            'OPENPNE_POST_INTERVAL_UNFAIR_COUNT_RESET_SECOND' => 60*60,
            'OPENPNE_POST_USE_DB' => true,
            'AMAZON_ACCESS_KEY_ID' => '',
            'AMAZON_SECRET_ACCESS_KEY' => '',
        // 固定値
            'AMAZON_LOCALE'  => 'jp',
            'AMAZON_BASEURL' => 'http://ecs.amazonaws.jp/onca/xml',
            'OPENPNE_REGIST_FROM_NONE'   => 0,
            'OPENPNE_REGIST_FROM_PC'     => 1,
            'OPENPNE_REGIST_FROM_KTAI'   => 2,
            'OPENPNE_REGIST_FROM_PCKTAI' => 3,
            'OPENPNE_FUNCTION_CACHE_LIFETIME_FAST' => 300,
            'OPENPNE_FUNCTION_CACHE_LIFETIME_SHORT' => 1200,
            'OPENPNE_FUNCTION_CACHE_LIFETIME_LONG' => 3600,
            'OPENPNE_DECORATION_CMD_URL' => 'http://www.openpne.jp/cmd/',
        );

        foreach ($defaults as $key => $value) {
            defined($key) or define($key, $value);
        }
    }
}

?>
