<?php
    $static_header_path = __DIR__ . DIRECTORY_SEPARATOR . 'static-components' . DIRECTORY_SEPARATOR . 'header.php';

    if ( file_exists( $static_header_path ) ) {
        include $static_header_path;
    }
?>

<body class="site__body">

<?php
    if (is_user_logged_in()) : ?>
        <header class="header">
            <?php  Component_Menu::the_menu('primary'); ?>
        </header>
    <?php endif;
?>
