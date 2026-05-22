<?php
/**
 * SharedChemistry clean discussions home model.
 */

namespace PH7;

use PDO;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Model\Engine\Model;

class DiscussionHomeModel extends Model
{
    public function getRecentDiscussions($iLimit = 20): array
    {
        $iLimit = max(1, (int)$iLimit);

        // SC_DISCUSSIONS_HOME_MODEL_V1_ACTIVE
        $rStmt = Db::getInstance()->prepare(
            'SELECT ' .
            'f.name, ' .
            'f.forumId, ' .
            't.topicId, ' .
            't.profileId, ' .
            't.title, ' .
            't.message, ' .
            't.createdDate, ' .
            't.updatedDate, ' .
            'COALESCE(e.short_description, \'\') AS short_description, ' .
            'COALESCE(p.photo_count, 0) AS photo_count ' .
            'FROM ' . Db::prefix('forums') . ' AS f ' .
            'INNER JOIN ' . Db::prefix('forums_topics') . ' AS t ' .
            'ON f.forumId = t.forumId ' .
            'LEFT JOIN ' . Db::prefix('sc_forum_topic_extras') . ' AS e ' .
            'ON t.topicId = e.topic_id ' .
            'LEFT JOIN (' .
            'SELECT topic_id, COUNT(*) AS photo_count ' .
            'FROM ' . Db::prefix('sc_forum_topic_photos') . ' ' .
            'GROUP BY topic_id' .
            ') AS p ' .
            'ON t.topicId = p.topic_id ' .
            'WHERE t.approved = \'1\' ' .
            'ORDER BY t.createdDate DESC ' .
            'LIMIT :limit'
        );
        $rStmt->bindValue(':limit', $iLimit, PDO::PARAM_INT);
        $rStmt->execute();
        $aTopics = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return is_array($aTopics) ? $aTopics : [];
    }

    public function getDefaultStartForum(): ?object
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT forumId, name ' .
            'FROM ' . Db::prefix('forums') . ' AS f ' .
            'ORDER BY forumId ASC ' .
            'LIMIT 1'
        );
        $rStmt->execute();
        $aForums = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return !empty($aForums[0]) ? $aForums[0] : null;
    }
}
