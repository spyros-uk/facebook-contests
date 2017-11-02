<?php Class Component_Gallery {

    static function get_the_thumbnail_src($gallery_item) {
        return wp_get_attachment_image_src( $gallery_item['ID'])[0];
    }

    static function the_thumbnail_src($gallery_item) {
        echo self::get_the_thumbnail_src($gallery_item);
    }

    static function get_the_original_sized_image_src($gallery_item) {
        return wp_get_attachment_image_src( $gallery_item['ID'], 'contest_background_large')[0];
    }

    static function the_original_sized_image_src($gallery_item) {
        echo self::get_the_original_sized_image_src($gallery_item);
    }

    static function get_the_gallery($gallery) {
        ob_start(); ?>

        <div class="prize__gallery" data-popup-gallery>
            <?php foreach ($gallery as $gallery_item): ?>
                <a href="<?php self::the_original_sized_image_src($gallery_item); ?>"
                   data-thumbnail-url="<?php self::the_thumbnail_src($gallery_item); ?>"
                   class="prize__gallery-item-link">
                    <img src="<?php self::the_thumbnail_src($gallery_item); ?>"
                         class="prize__gallery-item-image"
                         alt="">
                </a>
            <?php endforeach; ?>
        </div>

        <?php return ob_get_clean();
    }

    public static function the_gallery($gallery) {
        echo self::get_the_gallery($gallery);
    }
}
?>

