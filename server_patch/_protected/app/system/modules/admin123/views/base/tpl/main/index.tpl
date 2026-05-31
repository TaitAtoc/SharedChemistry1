{literal}
<style>
    .sc-admin-dashboard-offset{padding-top:145px}
    @media (max-width:767px){
        .sc-admin-dashboard-offset{padding-top:108px}
    }
</style>
{/literal}

<div class="sc-admin-dashboard-offset">
    {if $show_get_started_section}
      {manual_include 'get_started_intro.inc.tpl'}
    {/if}

    {manual_include 'stat.tpl'}

    {if $is_news_feed}
      <br /><hr /><br />
      {manual_include 'news.inc.tpl'}
    {/if}
</div>
