    <div class="noticeTypeA">
        <div class="box" id="counter">
            <h2>SNS情報</h2>
            <div class="innerBox">
<dl>
    <dt>総メンバー数</dt>
    <dd>({$info_member_count|number_format})人&nbsp;(前日登録&nbsp;({$info_member_count_yesterday|number_format})人)</dd>
    <dt>総コミュニティ数</dt>
    <dd>({$info_commu_count|number_format})</dd>
    <dt>アクティブ率</dt>
    <dd>({$info_member_rate_active|number_format:2})%</dd>
    <dt>平均フレンド数</dt>
    <dd>({$info_friend_count_avg|number_format:2})人</dd>
    <dt>今日の日記件数</dt>
    <dd>({$info_diary_count_today|number_format})件&nbsp;(前日({$info_diary_count_yesterday|number_format})件)</dd>
</dl>
            </div>
        </div>
    </div>
    <div class="noticeTypeB">
        ({if $smarty.const.DISPLAY_OPENPNE_INFO})
        <div class="box" id="topics">
            <h2>OpenPNEからのおしらせ</h2>
            <div class="innerBox">
<dl>
({t_assign_rss var=openpne_info url="`$smarty.const.OPENPNE_INFO_URL`"})
({foreach from=$openpne_info item=item})
    <dt>({$item.date|date_format:"%m/%d"})</dt>
    <dd><a href="({$item.link})" target="_blank">({$item.title})</a></dd>
({/foreach})
</dl>
            </div>
        </div>
        ({/if})
    </div>

    <br class="clear" />
