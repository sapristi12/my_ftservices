<?php
declare(strict_types=1);

/* For cookies we have to fill the blowfish_secret*/
$cfg['blowfish_secret'] = 'imfillingtheblowfishsecreterlajoua'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/* Servers configuration */
$i = 0;
$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'service-mysql'; /*mon service mysql*/
$cfg['Servers'][$i]['port'] = '3306'; /*port de mon mysql*/
$cfg['Servers'][$i]['user'] = 'erlajoua'; /*login de la database*/
$cfg['Servers'][$i]['password'] = '1212'; /*password de la database*/
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
