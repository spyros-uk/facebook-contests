<?php
/**
 * Header file specific
 * for page-fb template
 *
 */
?>

<body class="site__body--fb">

<?php
$static_header_path = __DIR__ . DIRECTORY_SEPARATOR . 'static-components' . DIRECTORY_SEPARATOR . 'header.php';

if (file_exists($static_header_path)) {
    include $static_header_path;
}
?>