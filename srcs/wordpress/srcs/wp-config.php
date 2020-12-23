<?php

/*nom de ma database*/
define( 'DB_NAME', 'wordpress' );
/*login user de ma database*/
define( 'DB_USER', 'erlajoua' );
/*mot de passe de ma database*/
define( 'DB_PASSWORD', '1212' );
/*nom du service qui gere la base de donnée mysql*/
define( 'DB_HOST', 'service-mysql' );

define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) )
{
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
