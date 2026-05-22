<?php
declare(strict_types=1);

function scPhysicalForumAuthConfigPath(): ?string
{
    $aCandidates = [
        __DIR__ . '/../app/configs/config.ini',
        __DIR__ . '/../_protected/app/configs/config.ini',
        __DIR__ . '/../../app/configs/config.ini',
        __DIR__ . '/../../ph7_source/app/configs/config.ini',
    ];

    foreach ($aCandidates as $sPath) {
        if (is_readable($sPath)) {
            return $sPath;
        }
    }

    return null;
}

function scPhysicalForumRequireMember(): void
{
    // SC_PHYSICAL_FORUM_AUTH_SAFE_V3_ACTIVE
    $sCookieName = 'PHS7SESS';
    $sSessionPrefix = 'pH73025e_';
    $sConfigPath = scPhysicalForumAuthConfigPath();
    if ($sConfigPath !== null) {
        $aConfig = parse_ini_file($sConfigPath, true);
        if (is_array($aConfig) && !empty($aConfig['session'])) {
            $sCookieName = (string)($aConfig['session']['cookie_name'] ?? $sCookieName);
            $sSessionPrefix = (string)($aConfig['session']['prefix'] ?? $sSessionPrefix);
        }
    }

    if (empty($_COOKIE[$sCookieName])) {
        header('Location: https://sharedchemistry.com/login', true, 302);
        exit;
    }

    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_name($sCookieName);
        session_start(['read_and_close' => true]);
    }

    $sMemberIdKey = $sSessionPrefix === 'pH73025e_' ? 'pH73025e_member_id' : $sSessionPrefix . 'member_id';
    $sUserAgentKey = $sSessionPrefix . 'member_http_user_agent';
    $bUserAgentMatches = empty($_SESSION[$sUserAgentKey]) || $_SESSION[$sUserAgentKey] === ($_SERVER['HTTP_USER_AGENT'] ?? '');

    if (empty($_SESSION[$sMemberIdKey]) || !$bUserAgentMatches) {
        header('Location: https://sharedchemistry.com/login', true, 302);
        exit;
    }
}

scPhysicalForumRequireMember();

const SC_SITE_URL = 'https://sharedchemistry.com';
const SC_TOPIC_LIMIT = 20;

function scFindConfigPath(): ?string
{
    $aCandidates = [
        __DIR__ . '/../app/configs/config.ini',
        __DIR__ . '/../_protected/app/configs/config.ini',
        __DIR__ . '/../../app/configs/config.ini',
        __DIR__ . '/../../ph7_source/app/configs/config.ini',
    ];

    foreach ($aCandidates as $sPath) {
        if (is_readable($sPath)) {
            return $sPath;
        }
    }

    return null;
}

function scConnect(): PDO
{
    $sConfigPath = scFindConfigPath();
    if ($sConfigPath === null) {
        throw new RuntimeException('Database config file was not found.');
    }

    $aConfig = parse_ini_file($sConfigPath, true);
    if (!is_array($aConfig) || empty($aConfig['database'])) {
        throw new RuntimeException('Database config section was not found.');
    }

    $aDb = $aConfig['database'];
    $sType = (string)($aDb['type'] ?? 'mysql');
    $sHost = (string)($aDb['hostname'] ?? 'localhost');
    $sPort = (string)($aDb['port'] ?? '3306');
    $sName = (string)($aDb['name'] ?? '');
    $sCharset = (string)($aDb['charset'] ?? 'utf8mb4');
    $sUser = (string)($aDb['username'] ?? '');
    $sPass = (string)($aDb['password'] ?? '');

    if ($sName === '' || $sUser === '') {
        throw new RuntimeException('Database config is incomplete.');
    }

    $sDsn = $sType . ':host=' . $sHost . ';port=' . $sPort . ';dbname=' . $sName . ';charset=' . $sCharset;

    return new PDO($sDsn, $sUser, $sPass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
}

function scRecentDiscussions(PDO $oDb): array
{
    $sSql = "
        SELECT
          f.name,
          f.forumId,
          t.topicId,
          t.profileId,
          t.title,
          t.message,
          t.createdDate,
          t.updatedDate,
          m.username,
          i.couple_profile_data,
          COALESCE(e.short_description, '') AS short_description,
          COALESCE(p.photo_count, 0) AS photo_count
        FROM ph7vz_forums AS f
        INNER JOIN ph7vz_forums_topics AS t
          ON f.forumId = t.forumId
        LEFT JOIN ph7vz_members AS m
          ON m.profileId = t.profileId
        LEFT JOIN ph7vz_members_info AS i
          ON i.profileId = t.profileId
        LEFT JOIN ph7vz_sc_forum_topic_extras AS e
          ON t.topicId = e.topic_id
        LEFT JOIN (
          SELECT topic_id, COUNT(*) AS photo_count
          FROM ph7vz_sc_forum_topic_photos
          GROUP BY topic_id
        ) AS p
          ON t.topicId = p.topic_id
        WHERE t.approved = '1'
        ORDER BY t.createdDate DESC
        LIMIT 20
    ";

    $oStmt = $oDb->query($sSql);
    $aRows = $oStmt->fetchAll(PDO::FETCH_OBJ);
    foreach ($aRows as $oRow) {
        // SC_FORUM_COUPLE_NAME_ON_CARDS_V1_ACTIVE
        $oRow->displayName = scForumTopicDisplayName($oRow);
    }

    return is_array($aRows) ? $aRows : [];
}

function scForumTopicDisplayName(object $oTopic): string
{
    $aCoupleProfile = json_decode((string)($oTopic->couple_profile_data ?? ''), true);
    if (is_array($aCoupleProfile) && !empty($aCoupleProfile['couple_name'])) {
        return (string)$aCoupleProfile['couple_name'];
    }

    if (!empty($oTopic->username)) {
        return (string)$oTopic->username;
    }

    return !empty($oTopic->profileId) ? 'Profile ' . (int)$oTopic->profileId : '';
}

function scDefaultForum(PDO $oDb): ?object
{
    $oStmt = $oDb->query('SELECT forumId, name FROM ph7vz_forums ORDER BY forumId ASC LIMIT 1');
    $aRows = $oStmt->fetchAll(PDO::FETCH_OBJ);

    return !empty($aRows[0]) ? $aRows[0] : null;
}

function scEscape($mValue): string
{
    return htmlspecialchars((string)$mValue, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function scSlug($mValue): string
{
    $sSlug = strtolower((string)$mValue);
    $sSlug = preg_replace('/[^a-z0-9]+/', '-', $sSlug);
    $sSlug = trim(is_string($sSlug) ? $sSlug : '', '-');

    return $sSlug !== '' ? $sSlug : 'discussion';
}

function scExcerpt($mValue, int $iLength = 160): string
{
    $sText = trim(preg_replace('/\s+/', ' ', strip_tags((string)$mValue)) ?? '');
    if (strlen($sText) <= $iLength) {
        return $sText;
    }

    return rtrim(substr($sText, 0, $iLength - 3)) . '...';
}

function scFormatDate($mValue): string
{
    $iTime = strtotime((string)$mValue);
    if ($iTime === false) {
        return '';
    }

    return date('M j, Y', $iTime);
}

$aTopics = [];
$oStartForum = null;
$bHasDataError = false;

try {
    $oDb = scConnect();
    $aTopics = scRecentDiscussions($oDb);
    $oStartForum = scDefaultForum($oDb);
} catch (Throwable $oError) {
    $bHasDataError = true;
    error_log('[SC_PHYSICAL_FORUM_HOME] ' . $oError->getMessage());
}
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Discussions - SharedChemistry</title>
    <meta name="description" content="Talk with other couples, share ideas, ask questions, and plan real connections.">
    <style>
        :root {
            color-scheme: dark;
            --bg: #100b10;
            --panel: #171017;
            --gold: #e9bb63;
            --pink: #e05879;
            --text: #fff8ef;
            --muted: #ddd2c8;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background:
                radial-gradient(circle at top left, rgba(224, 88, 121, .16), transparent 28rem),
                linear-gradient(180deg, #100b10 0%, #181018 46%, #0b080c 100%);
            color: var(--text);
            font-family: Arial, Helvetica, sans-serif;
            line-height: 1.5;
        }

        a {
            color: inherit;
        }

        .sc-shell {
            width: min(1180px, calc(100% - 32px));
            margin: 0 auto;
            padding: 22px 0 42px;
        }

        .sc-topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 24px;
        }

        .sc-logo {
            display: inline-flex;
            align-items: center;
            min-width: 0;
            text-decoration: none;
        }

        .sc-logo img {
            display: block;
            width: min(310px, 72vw);
            height: auto;
        }

        .sc-nav {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
            gap: 10px;
        }

        .sc-nav a {
            display: inline-flex;
            align-items: center;
            min-height: 38px;
            padding: 8px 4px;
            border: 0;
            border-radius: 0;
            background: transparent;
            color: var(--text);
            font-size: 13px;
            font-weight: 800;
            text-decoration: none;
        }

        .sc-nav a:hover {
            color: #ffe0a3;
        }

        .sc-nav a.is-dashboard {
            color: var(--gold);
        }

        .sc-hero {
            margin: 0 0 24px;
            padding: 34px;
            border: 1px solid rgba(233, 187, 99, .24);
            border-radius: 8px;
            background:
                radial-gradient(circle at top left, rgba(224, 88, 121, .24), transparent 34%),
                linear-gradient(135deg, rgba(233, 187, 99, .15), rgba(22, 17, 23, .96) 56%, rgba(10, 8, 12, .98));
            box-shadow: 0 22px 70px rgba(0, 0, 0, .32);
        }

        .sc-hero h1 {
            margin: 0;
            color: var(--text);
            font-size: 42px;
            font-weight: 800;
            line-height: 1.12;
        }

        .sc-hero p {
            max-width: 720px;
            margin: 14px 0 0;
            color: var(--muted);
            font-size: 17px;
            line-height: 1.7;
        }

        .sc-section-title {
            margin: 30px 0 16px;
            color: #ffe0a3;
            font-size: 18px;
            font-weight: 800;
        }

        .sc-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 22px;
            align-items: stretch;
        }

        .sc-card {
            position: relative;
            display: flex;
            min-height: 242px;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
            padding: 24px;
            border: 1px solid rgba(233, 187, 99, .28);
            border-radius: 8px;
            background-color: var(--panel);
            background-image:
                linear-gradient(135deg, rgba(12, 8, 12, .86), rgba(42, 15, 32, .72) 46%, rgba(7, 6, 9, .92)),
                url('/templates/themes/base/img/sharedchemistry/discussion-box-image.png');
            background-position: center;
            background-size: cover;
            box-shadow: 0 22px 58px rgba(0, 0, 0, .38);
            transition: border-color .18s ease, box-shadow .18s ease, transform .18s ease;
        }

        .sc-card:hover {
            border-color: rgba(224, 88, 121, .58);
            box-shadow: 0 26px 70px rgba(224, 88, 121, .16), 0 22px 58px rgba(0, 0, 0, .42);
            transform: translateY(-2px);
        }

        .sc-card-title {
            margin: 0 0 12px;
            color: var(--text);
            font-size: 22px;
            font-weight: 800;
            line-height: 1.24;
            text-shadow: 0 2px 18px rgba(0, 0, 0, .72);
        }

        .sc-card-title a {
            text-decoration: none;
        }

        .sc-card-desc {
            margin: 0;
            color: #f0e8df;
            font-size: 14px;
            line-height: 1.65;
            text-shadow: 0 2px 14px rgba(0, 0, 0, .72);
        }

        .sc-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin: 16px 0 0;
            color: #d8c3cb;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .sc-meta span {
            padding: 6px 8px;
            border: 1px solid rgba(255, 255, 255, .12);
            border-radius: 8px;
            background: rgba(0, 0, 0, .28);
        }

        .sc-button,
        .sc-button:visited {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: fit-content;
            min-height: 42px;
            margin-top: 22px;
            padding: 10px 16px;
            border: 0;
            border-radius: 8px;
            /* SC_FORUM_BUTTON_PURPLE_V2_ACTIVE */
            background: #c200fb;
            color: #fff;
            font-size: 14px;
            font-weight: 900;
            line-height: 1.2;
            text-decoration: none;
            box-shadow: 0 12px 28px rgba(194, 0, 251, .24);
        }

        .sc-button:hover,
        .sc-button:visited:hover {
            background: #ec0868;
            color: #f7f3ef;
        }

        .sc-button.is-disabled {
            opacity: .55;
            pointer-events: none;
        }

        .sc-empty {
            margin-top: 18px;
            padding: 18px 20px;
            border: 1px solid rgba(233, 187, 99, .22);
            border-radius: 8px;
            background: rgba(20, 15, 20, .88);
            color: #f0e8df;
        }

        @media (max-width: 767px) {
            .sc-shell {
                width: min(100% - 28px, 1180px);
                padding-top: 14px;
            }

            .sc-topbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .sc-nav {
                justify-content: flex-start;
            }

            .sc-hero {
                padding: 24px;
            }

            .sc-hero h1 {
                font-size: 34px;
            }

            .sc-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- SC_PHYSICAL_FORUM_HOME_V1_ACTIVE -->
<main class="sc-shell">
    <nav class="sc-topbar" aria-label="Primary">
        <a class="sc-logo" href="<?= SC_SITE_URL ?>/">
            <img src="/templates/themes/base/img/sharedchemistry/sharedchemistry-header-logo.png" alt="SharedChemistry">
        </a>
        <div class="sc-nav">
            <!-- SC_PHYSICAL_FORUM_LOGGED_IN_HEADER_V1_ACTIVE -->
            <a href="<?= SC_SITE_URL ?>/meet-people">People</a>
            <a href="<?= SC_SITE_URL ?>/free-chat-room">Chat</a>
            <a href="<?= SC_SITE_URL ?>/forum/index.php">Discussions</a>
            <a href="<?= SC_SITE_URL ?>/blog">Blog</a>
            <a href="<?= SC_SITE_URL ?>/mail">Messages</a>
            <a href="<?= SC_SITE_URL ?>/user/account/index">Account</a>
            <a class="is-dashboard" href="<?= SC_SITE_URL ?>/user-dashboard/main/index">Our Dashboard</a>
        </div>
    </nav>

    <section class="sc-hero">
        <h1>Discussions</h1>
        <p>Talk with other couples, share ideas, ask questions, and plan real connections.</p>
    </section>

    <h2 class="sc-section-title">Recent Discussions</h2>
    <section class="sc-grid" aria-label="Recent discussions">
        <article class="sc-card">
            <div>
                <h2 class="sc-card-title">Start a New Topic</h2>
                <p class="sc-card-desc">Start a new conversation and invite other couples to join in.</p>
            </div>
            <?php if ($oStartForum !== null): ?>
                <a class="sc-button" rel="nofollow" href="<?= SC_SITE_URL ?>/forum/add-topic/<?= rawurlencode(scSlug($oStartForum->name)) ?>/<?= (int)$oStartForum->forumId ?>">Start a New Topic</a>
            <?php else: ?>
                <span class="sc-button is-disabled">Start a New Topic</span>
            <?php endif; ?>
        </article>

        <?php foreach ($aTopics as $oTopic): ?>
            <?php
            $sTopicSlug = scSlug($oTopic->title ?? '');
            $sForumSlug = scSlug($oTopic->name ?? '');
            $sTopicUrl = SC_SITE_URL . '/forum/post/' . rawurlencode($sForumSlug) . '/' . (int)$oTopic->forumId . '/' . rawurlencode($sTopicSlug) . '/' . (int)$oTopic->topicId;
            $sDescription = trim((string)($oTopic->short_description ?? ''));
            if ($sDescription === '') {
                $sDescription = scExcerpt($oTopic->message ?? '');
            }
            ?>
            <article class="sc-card">
                <div>
                    <h3 class="sc-card-title">
                        <a href="<?= scEscape($sTopicUrl) ?>"><?= scEscape($oTopic->title ?? 'Discussion') ?></a>
                    </h3>
                    <p class="sc-card-desc"><?= scEscape($sDescription) ?></p>
                    <div class="sc-meta">
                        <?php if (!empty($oTopic->displayName)): ?>
                            <span><?= scEscape($oTopic->displayName) ?></span>
                        <?php endif; ?>
                        <?php if (!empty($oTopic->createdDate)): ?>
                            <span><?= scEscape(scFormatDate($oTopic->createdDate)) ?></span>
                        <?php endif; ?>
                        <?php if (!empty($oTopic->photo_count)): ?>
                            <span><?= (int)$oTopic->photo_count ?> photo(s)</span>
                        <?php endif; ?>
                    </div>
                </div>
                <a class="sc-button" href="<?= scEscape($sTopicUrl) ?>">Join the Discussion</a>
            </article>
        <?php endforeach; ?>
    </section>

    <?php if ($bHasDataError): ?>
        <div class="sc-empty">Discussions are temporarily unavailable.</div>
    <?php elseif (empty($aTopics)): ?>
        <div class="sc-empty">No discussions have been started yet.</div>
    <?php endif; ?>
</main>
</body>
</html>
