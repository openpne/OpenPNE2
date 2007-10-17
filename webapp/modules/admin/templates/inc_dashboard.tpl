    <div class="noticeTypeA">
        <div class="box" id="counter">
            <h2>SNS情報</h2>
            <div class="innerBox">
({t_assign_sns_info var=sns_info})
<dl>
    <dt>総メンバー数</dt>
    <dd>({$sns_info.info_member_count|number_format})人&nbsp;(前日登録&nbsp;({$sns_info.info_member_count_yesterday|number_format})人)</dd>
    <dt>総コミュニティ数</dt>
    <dd>({$sns_info.info_commu_count|number_format})</dd>
    <dt>アクティブ率</dt>
    <dd>({$sns_info.info_member_rate_active|number_format:2})%</dd>
    <dt>平均フレンド数</dt>
    <dd>({$sns_info.info_friend_count_avg|number_format:2})人</dd>
    <dt>今日の日記件数</dt>
    <dd>({$sns_info.info_diary_count_today|number_format})件&nbsp;(前日({$sns_info.info_diary_count_yesterday|number_format})件)</dd>
</dl>
            </div>
        </div>
    </div>
({fetch file=$smarty.const.OPENPNE_DASHBOARD_URL})
    <br class="clear" />