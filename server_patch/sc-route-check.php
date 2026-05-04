<?php
header('Content-Type: text/plain; charset=UTF-8');

function sc_bool_text($value)
{
    return $value ? 'true' : 'false';
}

function sc_line($label, $value)
{
    echo $label . ': ' . $value . "\n";
}

$root = __DIR__;

sc_line('SharedChemistry route diagnostic', 'true');
sc_line('script_name', isset($_SERVER['SCRIPT_NAME']) ? basename($_SERVER['SCRIPT_NAME']) : 'not available');
sc_line('host_name', isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'not available');
sc_line('php_version', PHP_VERSION);

if (function_exists('apache_get_modules')) {
    sc_line('apache_mod_rewrite', sc_bool_text(in_array('mod_rewrite', apache_get_modules())));
} else {
    sc_line('apache_mod_rewrite', 'not detectable from PHP');
}

echo "\n";
sc_line('exists_.htaccess', sc_bool_text(file_exists($root . DIRECTORY_SEPARATOR . '.htaccess')));
sc_line('exists_index.php', sc_bool_text(file_exists($root . DIRECTORY_SEPARATOR . 'index.php')));
sc_line('exists__constants.php', sc_bool_text(file_exists($root . DIRECTORY_SEPARATOR . '_constants.php')));
sc_line('exists_WebsiteChecker.php', sc_bool_text(file_exists($root . DIRECTORY_SEPARATOR . 'WebsiteChecker.php')));
sc_line('exists__protected', sc_bool_text(is_dir($root . DIRECTORY_SEPARATOR . '_protected')));
sc_line('exists_app', sc_bool_text(is_dir($root . DIRECTORY_SEPARATOR . 'app')));
sc_line('exists_data', sc_bool_text(is_dir($root . DIRECTORY_SEPARATOR . 'data')));
sc_line('exists_static', sc_bool_text(is_dir($root . DIRECTORY_SEPARATOR . 'static')));
sc_line('exists_templates', sc_bool_text(is_dir($root . DIRECTORY_SEPARATOR . 'templates')));
