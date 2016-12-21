<?php get_header(); ?>

<main class="site__main">
    <?php
    $user = get_userdata(2);
    print_r(get_role('client'));
    ?>
</main>

<?php get_footer(); ?>
