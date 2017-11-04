<?php get_header(); ?>

<?php if ( have_posts() ) : while ( have_posts() ) : the_post();
    $contest_id = get_the_id();
    $gallery_data = get_field('gallery', $contest_id);
?>
    <main class="site__main site__main--centered">
        <h1 class="title title--primary">
            <?php the_title(); ?>
        </h1>

        <div class="text text--low-margin">
            <?php the_content(); ?>
        </div>

        <?php Component_Prize::the_prize_featured_picture($contest_id); ?>

        <?php Component_Gallery::the_gallery($gallery_data) ?>
    </main>
<?php endwhile; endif; ?>

<?php get_footer(); ?>
