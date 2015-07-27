#!/bin/bash
set -e
## Download Z-BlogPHP
if ! [ -e /app/zb_users/c_option.php ]; then
	echo Downloading Z-BlogPHP...
	cd /app
	wget http://update.zblogcn.com/zblogphp/install.tar.gz
	tar -xf ./install.tar.gz
	rm index.php
	rm install.tar.gz
	cat > index.php <<-'EOF'
	<?php 
	header('302 Found');
	header('Location: install.php');
	unlink('./index.php');
	EOF

	## Modify permissions
	chown -R www-data:www-data /app
fi



exec "$@"
