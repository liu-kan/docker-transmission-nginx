<?php
          exec ("df -h > /tmp/df.out", $output); 
//          print_r( $output);
//echo "<br/>";
$myFile = "/tmp/df.out";
$fh = fopen($myFile, 'r');
$theData = fread($fh, filesize($myFile));
fclose($fh);
echo nl2br($theData);
