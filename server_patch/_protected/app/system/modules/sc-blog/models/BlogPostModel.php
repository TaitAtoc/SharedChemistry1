<?php
/**
 * SharedChemistry automation-friendly blog post model.
 */

namespace PH7;

use PDO;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Model\Engine\Model;

class BlogPostModel extends Model
{
    private const BLOG_POSTS_TABLE = 'sc_blog_posts';

    private const SELECT_FIELDS = '
        post_id,
        title,
        slug,
        excerpt,
        content,
        featured_image,
        meta_title,
        meta_description,
        created_at,
        updated_at,
        published_at,
        automation_source,
        automation_batch
    ';

    /**
     * Future automation can insert or update rows by slug in ph7vz_sc_blog_posts.
     * Public readers here only select published rows, so drafts remain hidden.
     */
    public function getPublishedPosts(int $iLimit = 12, int $iOffset = 0): array
    {
        $iLimit = max(1, min($iLimit, 50));
        $iOffset = max(0, $iOffset);
        $sBlogPostTable = Db::prefix(self::BLOG_POSTS_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT ' . self::SELECT_FIELDS . '
            FROM ' . $sBlogPostTable . '
            WHERE status = :status
            AND published_at IS NOT NULL
            AND published_at <= NOW()
            ORDER BY published_at DESC, post_id DESC
            LIMIT :offset, :limit'
        );
        $rStmt->bindValue(':status', 'published', PDO::PARAM_STR);
        $rStmt->bindValue(':offset', $iOffset, PDO::PARAM_INT);
        $rStmt->bindValue(':limit', $iLimit, PDO::PARAM_INT);
        $rStmt->execute();
        $aPosts = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return is_array($aPosts) ? $aPosts : [];
    }

    public function getPublishedPostBySlug(string $sSlug): ?object
    {
        $sBlogPostTable = Db::prefix(self::BLOG_POSTS_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT ' . self::SELECT_FIELDS . '
            FROM ' . $sBlogPostTable . '
            WHERE slug = :slug
            AND status = :status
            AND published_at IS NOT NULL
            AND published_at <= NOW()
            LIMIT 1'
        );
        $rStmt->bindValue(':slug', $sSlug, PDO::PARAM_STR);
        $rStmt->bindValue(':status', 'published', PDO::PARAM_STR);
        $rStmt->execute();
        $oPost = $rStmt->fetch(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $oPost ?: null;
    }

    public function countPublishedPosts(): int
    {
        $sBlogPostTable = Db::prefix(self::BLOG_POSTS_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT COUNT(post_id)
            FROM ' . $sBlogPostTable . '
            WHERE status = :status
            AND published_at IS NOT NULL
            AND published_at <= NOW()'
        );
        $rStmt->bindValue(':status', 'published', PDO::PARAM_STR);
        $rStmt->execute();
        $iTotalPosts = (int)$rStmt->fetchColumn();
        Db::free($rStmt);

        return $iTotalPosts;
    }
}
