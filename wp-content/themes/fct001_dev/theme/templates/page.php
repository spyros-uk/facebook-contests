<?php
/**
 * Template Name: Simple
 */
?>

<?php get_header(); ?>
<?php $page_object = get_queried_object(); ?>

<main class="site__main">
    <h1 class="title title--primary">
        <?php echo $page_object->post_title; ?>
    </h1>

    <div class="text text--low-margin">
        <?php echo $page_object->post_content; ?>
    </div>
</main>

<?php get_footer(); ?>
