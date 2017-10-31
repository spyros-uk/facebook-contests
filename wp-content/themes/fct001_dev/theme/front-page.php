<?php get_header(); ?>

<main class="site__main">
    <?php if (have_posts()) :  while (have_posts()) : the_post();

    $is_user_logged_in = is_user_logged_in();
    $class = $is_user_logged_in ? '' : 'hero-content--spaced';
    $pageId = get_the_ID();
    $title = get_field('title', $pageId);
    $description = get_field('description', $pageId);

?>

    <section class="hero-content">
        <h1 class="title title--primary">
            <?php echo $title; ?>
        </h1>

        <div class="text">
            <?php echo $description; ?>
        </div>

        <ul class="cta-list">
            <li class="cta-list__item">
                <?php
                echo $is_user_logged_in ?
                    Component_Button::the_dashboard_button() :
                    Component_Button::the_registration_button();
                ?>
            </li>
            <li class="cta-list__item">
                <?php
                echo $is_user_logged_in ?
                    Component_Button::the_logout_button() :
                    Component_Button::the_login_button();
                ?>
            </li>
        </ul>
    </section>

<?php endwhile; else : ?>
    <h1 class="offer__no-posts">
        <?php _e('No special Offers yet, more to come soon..!', 'fct001'); ?>
    </h1>
<?php endif; ?>

</main>

<?php get_footer(); ?>
