<?php
    $TEST='';
    
    switch($TEST){
        case 'reload':
            include('reload.php');
            die();
        case 'sleep':
            include('sleep.php');
            die();
        default:
            // Just show this page
    }
?>
<html>
  <head>
    <script>
      
    </script>
  </head>
  <body>
    <div><?php echo date(DATE_RFC822) . " at " . gethostname(); ?></div>
    <div><a href="reload.php">Reload test</a></div>
    <div><a href="sleep.php">Sleep test</a></div>
  </body>
</html>

  
