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
            $gallery = get_field('gallery', $contest->ID);
            ?>
            <div class="prize-list__item">
                <div class="prize">
                    <h3 class="prize__title">
                        <?php echo $contest->post_title; ?>
                    </h3>
                    <div class="prize__content">
                        <?php echo $contest->post_content; ?>
                    </div>
                    <div>
                        <?php echo $start_date; ?>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
</main>

<?php get_footer(); ?>
