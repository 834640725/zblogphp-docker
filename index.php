<?php 
header('302 Found');
header('Location: install.php');
unlink('./index.php');
