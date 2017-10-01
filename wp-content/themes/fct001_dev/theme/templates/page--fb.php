<?php
/**
 * Template Name: FB Contests
 */
?>

<?php get_header('fb'); ?>


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


<main class="contest-list">

    <?php foreach ($contests as $contest) :
        $image_id = get_post_thumbnail_id( $contest->ID );
        $start_date = get_field('start_date', $contest->ID);
        $is_draw_active = SDP_DATE::is_not_outdated($start_date);
        $remaining_full_time = SDP_DATE::get_remaining_time_with_units($start_date);

        if ($is_draw_active) :
            $gallery = get_field('gallery', $contest->ID); ?>
            <section class="contest-list__item">
                <div class="contest-list-item__wrapper">
                    <h2 class="contest-list-item__title">
                        <?php echo $contest->post_title; ?>
                    </h2>
                    <div class="contest-list-item__details">
                        <?php echo $contest->post_content ?>
                    </div>
                    <?php
                    SDP_Image::background(
                        $image_id,
                        'contest_background_small',
                        array(
                            'contest_background_medium' => '(min-width: 600px)',
                            'contest_background_large' => '(min-width: 1024px)'),
                        array(
                            'class' => 'contest-list-item__background'
                        ));
                    ?>
                </div>
            </section>
        <?php endif; ?>
    <?php endforeach; ?>

</main>