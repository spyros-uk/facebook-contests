<?php
/**
 * Template Name: Active Draws
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

<main class="stite__main">
    <h1>
        <?php echo $page_object->post_title; ?>
    </h1>

    <div>
        <?php echo $page_object->post_content; ?>
    </div>

    <section class="prize-list">
        <?php foreach ($contests as $contest) :
            $start_date = get_field('start_date', $contest->ID);
            $is_draw_active = SDP_DRAWS::is_draw_active($start_date);
            $remaining_time = SDP_DATE::get_date_diff($start_date);
            $dateClass = new SDP_DATE();
            $remaining_full_time = $dateClass->get_remaining_time_with_units($start_date);

                if ($is_draw_active) :
                    $gallery = get_field('gallery', $contest->ID); ?>
                    <section class="prize-list__item">
                        <div class="prize">
                            <div class="prize__front">
                                <h2 class="prize__title">
                                    <?php echo $contest->post_title; ?>
                                </h2>
                                <div class="prize__time-info">

                                </div>
                                <div class="prize__social-info">
                                    <div class="prize__social-cta">

                                    </div>
                                    <div class="prize__social-count">

                                    </div>
                                </div>
                                <div class="prize__social-info">
                                    <div class="prize__social-cta">

                                    </div>
                                    <div class="prize__social-count">

                                    </div>
                                </div>
                            </div>
                            <div class="prize__back">
                                <div class="prize-tabs">
                                    <h3 class="prize-tab__title"></h3>
                                    <div class="prize-tab__description">

                                    </div>
                                    <h3 class="prize-tab__title">

                                    </h3>
                                    <div class="prize-tab__gallery">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="prize">

                            <h3 class="prize__title">
                                <?php echo $contest->post_title; ?>
                            </h3>
                            <div class="prize__content">
                                <?php echo $contest->post_content; ?>
                            </div>
                            <div >
                                <?php
                                    var_dump($remaining_full_time);
                                ?>
                            </div>
                        </div>
                    </section>
                <?php endif; ?>
        <?php endforeach; ?>
</main>

<?php get_footer(); ?>
