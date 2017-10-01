<?php
/**
 * Header file specific
 * for page-fb template
 *
 */
?>

<?php
$static_header_path = __DIR__ . DIRECTORY_SEPARATOR . 'static-components' . DIRECTORY_SEPARATOR . 'header.php';

if (file_exists($static_header_path)) {
    include $static_header_path;
}
?>