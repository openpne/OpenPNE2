<?php


class admin_page_user_analysis_profile extends OpenPNE_Action
{
    function execute($requests)
    {

        //----------リクエスト変数-------------//
        $target_c_profile_id = $requests['target_c_profile_id'];
        //----------リクエスト変数-------------//

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        
        $analysis_profile = get_analysis_profile($target_c_profile_id);
        $this->set("analysis_profile", $analysis_profile);
        $this->set("count_profile_all", get_analysis_count_profile_all($target_c_profile_id));
        
        $profile_list = analysis_profile4c_profile_id($target_c_profile_id);
        $this->set("profile_caption", $profile_list['caption']);

        return 'success';
    }
}

?>
