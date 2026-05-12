{literal}
<style>
body {
    background: #101114 !important;
}

#headings {
    display: none !important;
}

main#content {
    max-width: 1120px !important;
    margin: 0 auto !important;
    padding: 44px 15px 104px !important;
    background: transparent !important;
    border: 0 !important;
    box-shadow: none !important;
}

.sc-mail-page,
.sc-mail-page * {
    box-sizing: border-box;
}

.sc-mail-page {
    width: 100%;
    color: #F7F3EF;
}

.sc-mail-header {
    width: min(100%, 1060px);
    margin: 0 auto 22px;
}

.sc-mail-header h1 {
    margin: 0 0 7px;
    color: #F7F3EF;
    font-size: 34px;
    font-weight: 800;
    line-height: 1.15;
}

.sc-mail-header p {
    margin: 0;
    color: #B8B3B0;
    font-size: 15px;
}

.sc-mail-list-shell {
    width: min(100%, 1060px);
    margin: 0 auto;
}

.sc-mail-list-form {
    margin: 0;
}

.sc-mail-list {
    display: grid;
    gap: 12px;
}

.sc-mail-card {
    display: grid;
    grid-template-columns: 30px 54px minmax(0, 1fr) auto;
    gap: 14px;
    align-items: center;
    min-height: 102px;
    padding: 17px 18px;
    background: #17181D;
    border: 1px solid rgba(247, 243, 239, .09);
    border-radius: 14px;
    box-shadow: 0 18px 45px rgba(0, 0, 0, .23);
}

.sc-mail-card.is-unread {
    border-color: rgba(255, 188, 10, .42);
    background: #202127;
}

.sc-mail-select {
    display: flex;
    align-items: center;
    justify-content: center;
}

.sc-mail-select input,
.sc-mail-bulk-check input {
    width: 18px;
    height: 18px;
    accent-color: #EC0868;
}

.sc-mail-avatar {
    width: 46px;
    height: 46px;
    overflow: hidden;
    border-radius: 50%;
    background: #202127;
    border: 1px solid rgba(236, 8, 104, .35);
}

.sc-mail-avatar img,
.sc-mail-avatar .avatar {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover;
    border-radius: 50%;
}

.sc-mail-main {
    display: block;
    min-width: 0;
    color: #F7F3EF;
    text-decoration: none;
}

.sc-mail-main:hover,
.sc-mail-main:focus {
    color: #F7F3EF;
    text-decoration: none;
}

.sc-mail-row-top {
    display: flex;
    gap: 10px;
    align-items: center;
    min-width: 0;
    margin-bottom: 3px;
}

.sc-mail-sender {
    min-width: 0;
    overflow: hidden;
    color: #F7F3EF;
    font-size: 15px;
    font-weight: 800;
    line-height: 1.25;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.sc-mail-badge {
    flex: 0 0 auto;
    padding: 3px 8px;
    color: #101114;
    background: #FFBC0A;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 800;
    line-height: 1;
    text-transform: uppercase;
}

.sc-mail-subject {
    display: block;
    overflow: hidden;
    margin-bottom: 4px;
    color: #F7F3EF;
    font-size: 16px;
    font-weight: 700;
    line-height: 1.25;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.sc-mail-preview {
    display: block;
    overflow: hidden;
    color: #B8B3B0;
    font-size: 14px;
    line-height: 1.45;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.sc-mail-date {
    display: block;
    margin-top: 6px;
    color: rgba(184, 179, 176, .78);
    font-size: 12px;
}

.sc-mail-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: flex-end;
}

.sc-mail-action,
.sc-mail-bulk-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 38px;
    padding: 0 15px;
    color: #F7F3EF !important;
    background: rgba(236, 8, 104, .16);
    border: 1px solid rgba(236, 8, 104, .58);
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
    line-height: 1;
    text-decoration: none !important;
    cursor: pointer;
}

.sc-mail-action:hover,
.sc-mail-action:focus,
.sc-mail-bulk-button:hover,
.sc-mail-bulk-button:focus {
    color: #F7F3EF !important;
    background: #EC0868;
    text-decoration: none !important;
}

.sc-mail-action.is-danger {
    background: rgba(255, 188, 10, .1);
    border-color: rgba(255, 188, 10, .45);
}

.sc-mail-bulk {
    display: flex;
    gap: 16px;
    align-items: center;
    justify-content: space-between;
    margin-top: 16px;
    padding: 14px 16px;
    background: #202127;
    border: 1px solid rgba(247, 243, 239, .08);
    border-radius: 14px;
}

.sc-mail-bulk-check {
    display: inline-flex;
    gap: 9px;
    align-items: center;
    margin: 0;
    color: #B8B3B0;
    font-size: 14px;
    font-weight: 700;
}

.sc-mail-bulk-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: flex-end;
}

.sc-mail-empty {
    width: min(100%, 760px);
    margin: 0 auto;
    padding: 28px;
    color: #B8B3B0;
    background: #17181D;
    border: 1px solid rgba(247, 243, 239, .09);
    border-radius: 14px;
    text-align: center;
}

.sc-mail-page .pagination,
.sc-mail-page .pages {
    margin-top: 22px;
}

@media (max-width: 760px) {
    main#content {
        padding: 30px 12px 90px !important;
    }

    .sc-mail-header h1 {
        font-size: 28px;
    }

    .sc-mail-card {
        grid-template-columns: 28px 46px minmax(0, 1fr);
        gap: 12px;
        padding: 15px;
    }

    .sc-mail-actions {
        grid-column: 1 / -1;
        justify-content: stretch;
    }

    .sc-mail-action {
        flex: 1 1 120px;
    }

    .sc-mail-bulk {
        align-items: stretch;
        flex-direction: column;
    }

    .sc-mail-bulk-actions {
        justify-content: stretch;
    }

    .sc-mail-bulk-button {
        flex: 1 1 auto;
    }
}
</style>
{/literal}

<div class="sc-mail-page">
    <div class="sc-mail-header">
        <h1>{lang 'Messages'}</h1>
        <p>{lang 'View and reply to private messages.'}</p>
    </div>

    {include 'list.inc.tpl'}
</div>
