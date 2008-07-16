        ({if $data.kind eq PORTAL_LAYOUT_COMMUNITY})
            ({assign var="title" value="最新`$WORD_COMMUNITY`書き込み"})
            ({if $data.is_image && !$smarty.const.CHECK_IMG_AUTH})
            <div class="box PatternF">
                <div class="ttl"><h2>({$title})</h2></div>
                <div class="innerBox">
                    ({if $data.contents})
                    <ul>
                        ({foreach from=$data.contents item=item})
                        <li>
                            <span><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.commu_name})" /></span>
                            <dl>
                                <dt>({$item.u_datetime|date_format:"%m/%d"})</dt>
                                <dd>({$item.name})&nbsp;(({$item.count_comments|number_format}))&nbsp;(({$item.commu_name}))</dd>
                            </dl>
                        </li>
                        ({/foreach})
                    </ul>
                    ({else})
                    <dl>
                        <dt>&nbsp;</dt>
                        <dd>&nbsp;</dd>
                    </dl>
                    ({/if})
                </div>
            </div>
            ({else})
            <div class="box PatternA">
                <div class="ttl"><h2>({$title})</h2></div>
                <div class="innerBox">
                    ({if $data.contents})
                    <dl>
                        ({foreach from=$data.contents item=item})
                        <dt>({$item.u_datetime|date_format:"%m/%d"})</dt>
                        <dd>({$item.name})&nbsp;(({$item.count_comments|number_format}))&nbsp;(({$item.commu_name}))</dd>
                        ({/foreach})
                    </dl>
                    ({else})
                    <dl>
                        <dt>&nbsp;</dt>
                        <dd>&nbsp;</dd>
                    </dl>
                     ({/if})
                 </div>
             </div>
             ({/if})
         ({elseif $data.kind eq PORTAL_LAYOUT_REVIEW})
             ({assign var="title" value="最新レビュー"})
             ({if $data.is_image})
             <div class="box PatternF">
                 <div class="ttl"><h2>({$title})</h2></div>
                 <div class="innerBox">
                     ({if $data.contents})
                     <ul>
                         ({foreach from=$data.contents item=item})
                        <li>
                            <span>
                            ({if $item.c_review.image_small})
                                <img src="({$item.c_review.image_small})" />
                            ({else})
                                <img src="({t_img_url_skin filename=no_logo_small})" />
                            ({/if})
                            </span>
                            <dl>
                                <dt>({$item.r_datetime|date_format:"%m/%d"})</dt>
                                <dd><a href="({$item.c_review.url})" target="_blank">({$item.c_review.title})</a>&nbsp;(({$item.c_member.nickname}))</dd>
                            </dl>
                        </li>
                        ({/foreach})
                    </ul>
                    ({else})
                    <ul>
                        <li>&nbsp;</li>
                    </ul>
                   ({/if})
               </div>
           </div>
            ({else})
           <div class="box PatternA">
               <div class="ttl"><h2>({$title})</h2></div>
               <div class="innerBox">
                   ({if $data.contents})
                   <dl>
                       ({foreach from=$data.contents item=item})
                       <dt>({$item.r_datetime|date_format:"%m/%d"})</dt>
                       <dd><a href="({$item.c_review.url})" target="_blank">({$item.c_review.title})</a>&nbsp;(({$item.c_member.nickname}))</dd>
                       ({/foreach})
                   </dl>
                   ({else})
                       <dl>
                           <dt>&nbsp;</dt>
                           <dd>&nbsp;</dd>
                       </dl>
                   ({/if})
               </div>
           </div>
            ({/if})
       ({elseif $data.kind eq PORTAL_LAYOUT_ACCESS_RANKING})
           ({assign var="title" value="メンバーアクセスランキング"})
           <div class="box PatternB">
               <div class="ttl"><h2>({$title})</h2></div>
               <div class="innerBox">
                   ({if $data.contents})
                   <dl>
                       ({foreach name=access_ranking key=key from=$data.contents item=item})
                           ({foreach name=access_ranking_item from=$item item=item1})
                           <dt>({$key})位</dt>
                           <dd>({$item1.c_member.nickname})&nbsp;(({$item1.count|number_format})アクセス)</dd>
                           ({/foreach})
                       ({/foreach})
                   </dl>
                   ({else})
                       <dl>
                           <dt>&nbsp;</dt>
                           <dd>&nbsp;</dd>
                       </dl>
                   ({/if})
               </div>
           </div>
       ({elseif $data.kind eq PORTAL_LAYOUT_COMMUNITY_RANKING})
           ({assign var="title" value="`$WORD_COMMUNITY`盛り上がりランキング"})
            ({if $data.is_image && !$smarty.const.CHECK_IMG_AUTH})
           <div class="box PatternF">
               <div class="ttl"><h2>({$title})</h2></div>
               <div class="innerBox">
                   ({if $data.contents})
                   <ul>
                       ({foreach name=access_ranking key=key from=$data.contents item=item})
                           ({foreach name=access_ranking_item from=$item item=item1})
                            <li>
                            <span><img src="({t_img_url filename=$item1.c_commu.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.commu_name})" /></span>
                            <dl>
                            <dt>({$key})位</dt>
                            <dd>({$item1.c_commu.name})&nbsp;(書き込み({$item1.count|number_format})件)</dd>
                             </dl>
                             </li>
                             ({/foreach})
                         ({/foreach})
                     </ul>
                     ({else})
                     <ul>
                         <li>&nbsp;</li>
                     </ul>
                     ({/if})
                 </div>
             </div>
             ({else})
             <div class="box PatternB">
                 <div class="ttl"><h2>({$title})</h2></div>
                 <div class="innerBox">
                     ({if $data.contents})
                     <dl>
                         ({foreach name=access_ranking key=key from=$data.contents item=item})
                             ({foreach name=access_ranking_item from=$item item=item1})
                             <dt>({$key})位</dt>
                             <dd>({$item1.c_commu.name})&nbsp;(書き込み({$item1.count|number_format})件)</dd>
                             ({/foreach})
                         ({/foreach})
                     </dl>
                     ({else})
                     <dl>
                         <dt>&nbsp;</dt>
                         <dd>&nbsp;</dd>
                     </dl>
                     ({/if})
                 </div>
             </div>
             ({/if})
         ({elseif $data.kind eq PORTAL_LAYOUT_EVENT})
             ({assign var="title" value="イベント予定"})
             <div class="box PatternA">
                 <div class="ttl"><h2>({$title})</h2></div>
                 <div class="innerBox">
                     ({if $data.contents})
                     <dl>
                         ({foreach from=$data.contents item=item})
                         <dt>({$item.open_date|date_format:"%m/%d"})</dt>
                         <dd>({$item.event_name})&nbsp;(({$item.community_name}))</dd>
                         ({/foreach})
                     </dl>
                     ({else})
                     <dl>
                         <dt>&nbsp;</dt>
                         <dd>&nbsp;</dd>
                     </dl>
                     ({/if})
                 </div>
             </div>
         ({elseif $data.kind eq PORTAL_LAYOUT_RSS1 || $data.kind eq PORTAL_LAYOUT_RSS2 || $data.kind eq PORTAL_LAYOUT_RSS3 || $data.kind eq PORTAL_LAYOUT_RSS4 || $data.kind eq PORTAL_LAYOUT_RSS5})
             ({if $data.contents})
             ({if $data.is_image})
             <div class="box PatternF">
                <div class="ttl"><h2>({$data.contents[0]})</h2></div>
                <div class="innerBox">
                    <ul>
                        ({section name=rss loop=$data.contents[1] max="5"})
                        <li>
                            <span>
                                ({if $data.contents[1][rss].image_url})
                                <img src="({$data.contents[1][rss].image_url})" width="76" />
                                ({else})
                                <img src="({t_img_url_skin filename=no_logo_small})" width="76" height="76" />
                                ({/if})
                            </span>
                            <dl>
                                <dt>({$data.contents[1][rss].date|date_format:"%m/%d %H:%M"})</dt>
                                <dd><a href="({$data.contents[1][rss].link})" target="_blank">({$data.contents[1][rss].title})</a></dd>
                            </dl>
                        </li>
                        ({/section})
                    </ul>
                </div>
            </div>
            ({else})
            <div class="box PatternD">
                <div class="ttl"><h2>({$data.contents[0]})</h2></div>
                <div class="innerBox">
                    <dl>
                        ({section name=rss loop=$data.contents[1] max="5"})
                        <dt>({$data.contents[1][rss].date|date_format:"%m/%d %H:%M"})</dt>
                        <dd><a href="({$data.contents[1][rss].link})" target="_blank">({$data.contents[1][rss].title})</a></dd>
                        ({/section})
                    </dl>
                </div>
            </div>
            ({/if})
            ({else})
            <div class="box PatternE">
                <div class="ttl"><h2>RSSリーダー</h2></div>
                <div class="innerBox">
                    <div class="freeArea">RSSが取得できませんでした。</div>
                </div>
            </div>
           ({/if})
       ({elseif $data.kind eq PORTAL_LAYOUT_FREE1 || $data.kind eq PORTAL_LAYOUT_FREE2 || $data.kind eq PORTAL_LAYOUT_FREE3 || $data.kind eq PORTAL_LAYOUT_FREE4 || $data.kind eq PORTAL_LAYOUT_FREE5})
           <div class="box PatternC">
               ({if $data.contents})
                   ({$data.contents|smarty:nodefaults|t_url2cmd:"":"":0|t_cmd})
               ({else})
                   <br />
               ({/if})
           </div>
       ({elseif $data.kind == PORTAL_LAYOUT_LINK})
            ({assign var="title" value="リンク集"})
           <div class="box PatternG">
               <div class="ttl"><h2>({$title})</h2></div>
                <div class="innerBox">
                   ({if $data.contents})
                    <ul>
                        ({foreach from=$data.contents item=item})
                        <li><a href="({$item.url})"({if $item.is_target_blank}) target="_blank"({/if})>({$item.title})</a></li>
                         ({/foreach})
                     </ul>
                     ({else})
                     <dl>
                         <dt>&nbsp;</dt>
                         <dd>&nbsp;</dd>
                     </dl>
                     ({/if})
                 </div>
             </div>
         ({/if})
