<?php get_header(); ?>

<main class="site__main">
    <?php if (have_posts()) : ?>

        <?php while (have_posts()) : the_post(); ?>
            <?php
            $pageId = get_the_ID();
            $title = get_field('title', $pageId);
            $description = get_field('description', $pageId);
            $ctas = get_field('ctas', $pageId);
            ?>

            <h1 class="title title--primary">
                <?php echo $title; ?>
            </h1>

            <section class="section">
                <?php echo $description; ?>
            </section>

            <ul class="cta-list">
                <?php foreach ($ctas as $cta) : ?>
                    <li class="cta-list__item">
                        <?php SDP_Link::the_link($cta, 'button'); ?>
                    </li>
                <?php endforeach; ?>
            </ul>

        <?php endwhile; ?>

    <?php else : ?>
        <h1 class="offer__no-posts">
            <?php _e('No special Offers yet, more to come soon..!', 'gmv001'); ?>
        </h1>
    <?php endif; ?>

</main>

<?php get_footer(); ?>
