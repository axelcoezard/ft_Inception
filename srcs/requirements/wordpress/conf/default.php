<?php
	define("DB_NAME",				getenv("MARIADB_DATABASE"));
	define("DB_USER",				getenv("MARIADB_USER"));
	define("DB_PASSWORD",			getenv("MARIADB_PASSWORD"));
	define("DB_HOST",				getenv("WORDPRESS_MARIADB_HOST"));
	define("DB_CHARSET",			getenv("MARIADB_CHARSET"));
	define("DB_COLLATE",			getenv("MARIADB_COLLATE"));

	define('AUTH_KEY',				'2>#Zc9]> ChGj2`rJX++n{ /~Jc)ha^j1:EX(n_oj&.jMbSy--5qpPcUX9bs$F_I');
	define('SECURE_AUTH_KEY',		'PN/_MlG:%[*`cgsWc!VnkU6&^K$A6$%+|sGrBf9F)SRmq]^-[$#Roi#-#ir.;;/Z');
	define('LOGGED_IN_KEY',			'&v06[Qp!`s/+|m<]dWL5H{q>9iWA`I5p1A@Bsugm`b?g|y#O-arA_/ee*wE`m%$x');
	define('NONCE_KEY',				'OGip0)Z{dB|fRKA<Z&0Pd8#]+E).qRrA!*zu>h8o!;O+VX#.6KK=vJ5-I,[+.KT+');
	define('AUTH_SALT',				'(|c,Cfq`gzz_A;We|Q! e-v.7&xXw`wzy?2IR;o.gagd71w<?Sj{^?&)M}+|c-vj');
	define('SECURE_AUTH_SALT',		'h`Q}eo(h,AgN{C vqu4RU@/}O,,JUQP,8h8^W7pg+g|@17&5J&d!+,Y6jVp@/! 2');
	define('LOGGED_IN_SALT',		'gr18NT+Ec2|+vs2bk` w1[/7 FeX_3WWbWBh|MX+;N#,N(L.4NM=u;x1`*nO,a_5');
	define('NONCE_SALT',			'MDg{iGuQ1=OWbAMsVS*?OU_Icxc~FL8|e`]vb-ODU--w*;}/}i-;ZS9M@BXVc(qd');
	#define("CONCATENATE_SCRIPTS",	false);

	$table_prefix =					getenv("MARIADB_PREFIX");

	define("WP_DEBUG", false);
	if (!defined("ABSPATH"))
		define("ABSPATH", __DIR__ . "/");

	require_once ABSPATH . "wp-settings.php";
