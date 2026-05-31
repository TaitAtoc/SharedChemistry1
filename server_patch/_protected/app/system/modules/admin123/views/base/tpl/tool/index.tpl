{literal}
<style>
    .sc-admin-tool-offset{padding-top:145px}
    @media (max-width:767px){
        .sc-admin-tool-offset{padding-top:108px}
    }
</style>
{/literal}

<div class="sc-admin-tool-offset">
    <div class="center">
        <div class="border m_marg vs_padd">
            <h2>{lang 'Database'}</h2>
            {{ LinkCoreForm::display(t('Optimization Tables'), PH7_ADMIN_MOD, 'tool', 'optimize', array('is'=>1)) }} &nbsp; &bull; &nbsp;
            {{ LinkCoreForm::display(t('Repair Tables'), PH7_ADMIN_MOD, 'tool', 'repair', array('is'=>1)) }}
            <p class="small">{lang 'These actions can take minutes depending of the database size.'}</p>
        </div>
    </div>
</div>
