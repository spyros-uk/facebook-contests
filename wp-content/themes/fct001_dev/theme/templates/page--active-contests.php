<?php
/**
 * Template Name: Active Contests
 */
?>

<?php get_header(); ?>

<?php

$page_object = get_queried_object();

$args = array(
    'posts_per_page' => 10,
    'offset' => 0,
    'category' => '',
    'category_name' => '',
    'orderby' => 'date',
    'order' => 'DESC',
    'include' => '',
    'exclude' => '',
    'meta_key' => '',
    'meta_value' => '',
    'post_type' => 'fct_contest',
    'post_mime_type' => '',
    'post_parent' => '',
    'author' => '',
    'author_name' => '',
    'post_status' => 'publish',
    'suppress_filters' => true
);

$contests = get_posts($args);
?>

<main class="site__main">
    <h1 class="title title--primary">
        <?php echo $page_object->post_title; ?>
    </h1>

    <div class="text text--low-margin">
        <?php echo $page_object->post_content; ?>
    </div>

    <section class="prize-list">
        <?php foreach ($contests as $contest) :
            $image_id = get_post_thumbnail_id( $contest->ID );
            $start_date = get_field('start_date', $contest->ID);
            $is_draw_active = SDP_DATE::is_not_outdated($start_date);
            $remaining_full_time = SDP_DATE::get_remaining_time_with_units($start_date);

                if ($is_draw_active) :
                    $gallery = get_field('gallery', $contest->ID); ?>
                    <div class="prize-list__item">
                        <div class="prize">
                            <?php
                            SDP_Image::background(
                                $image_id,
                                'contest_background_small',
                                array(
                                    'contest_background_medium' => '(min-width: 600px)',
                                    'contest_background_large' => '(min-width: 1024px)'),
                                array(
                                    'class' => 'prize__background'
                                ));
                            ?>
                            <div class="prize__header">
                                <h2 class="prize__title">
                                    <?php echo $contest->post_title; ?>
                                </h2>
                                <div class="prize__time-info">
                                    <span class="prize__time-value">
                                        <?php echo $remaining_full_time->time ?>
                                    </span>
                                    <span class="prize__time-units">
                                        <?php echo $remaining_full_time->units ?>
                                    </span>
                                </div>
                            </div>

                            <div class="prize__body">
                                <div class="prize__description">
                                    <?php echo $contest->post_content ?>
                                </div>
                                <div class="prize__gallery" data-popup-gallery>
                                    <?php foreach ($gallery as $gallery_item):
                                        $src_thumb = wp_get_attachment_image_src( $gallery_item['ID'])[0];
                                        $src_large = wp_get_attachment_image_src( $gallery_item['ID'], 'contest_background_large')[0];
                                    ?>
                                        <a href="<?php echo $src_large; ?>"
                                           data-thumbnail-url="<?php echo $src_thumb; ?>"
                                           class="prize__gallery-item-link">
                                            <img src="<?php echo $src_thumb; ?>"
                                                 class="prize__gallery-item-image"
                                                 alt="">
                                        </a>
                                    <?php endforeach; ?>
                                </div>
                            </div>

                            <div class="prize__footer">
                                <button class="prize__more"></button>
                                <div class="prize__likes">
                                    <div class="fb-like"
                                         data-href="<?php the_permalink($contest->ID); ?>"
                                         data-layout="button"
                                         data-action="like"
                                         data-size="small"
                                         data-show-faces="true"
                                         data-share="true">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
        <?php endforeach; ?>
</main>

<?php get_footer(); ?>
