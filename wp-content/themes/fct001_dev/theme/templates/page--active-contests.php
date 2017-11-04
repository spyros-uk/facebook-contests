<?php
/**
 * Template Name: Active Contests
 */
?>

<?php get_header(); ?>

<?php
$page_object = get_queried_object();
$current_user = wp_get_current_user();
$is_admin = (is_user_logged_in() && current_user_can('activate_plugins'));
$author = $is_admin ? '' : $current_user->data->ID;

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
    'author' => $author,
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
            $start_date = get_field('start_date', $contest->ID);
            $is_draw_active = SDP_DATE::is_not_outdated($start_date);
            $remaining_full_time = SDP_DATE::get_remaining_time_with_units($start_date);

                if ($is_draw_active) :
                    $gallery_data = get_field('gallery', $contest->ID); ?>
                    <div class="prize-list__item">
                        <div class="prize">
                            <?php Component_Prize::the_prize_background($contest); ?>
                            <div class="prize__header">
                                <h2 class="prize__title">
                                    <a href="<?php the_permalink($contest->ID) ?>"
                                       class="prize__link">
                                        <?php echo $contest->post_title; ?>
                                    </a>
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
                                <?php Component_Gallery::the_gallery($gallery_data) ?>
                            </div>

                            <div class="prize__footer">
                                <div class="prize__likes" data-permalink="<?php the_permalink($contest->ID); ?>">
                                    <?php SDP_FB::get_object_likes_count_with_description(get_the_permalink($contest->ID)); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
        <?php endforeach; ?>
</main>

<?php get_footer(); ?>
