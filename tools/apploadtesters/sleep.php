<?php
    if (isset($_GET['rand']) && $_GET['rand'] == '1')
    {
        $sleeptime = rand(1, 60);
    }
    else if (isset($_GET['sleeptime']) && $_GET['sleeptime'] > 0)
    {
        $sleeptime = $_GET['sleeptime'];
    }
    else
    {
        $sleeptime = 5;
    }
?>    
<html>
  <head>
    <script>
      
    </script>
  </head>
  <body>
    <div><?php echo date(DATE_RFC822) . " at " . gethostname(); ?></div>
    <div>Sleeping for <?php echo $sleeptime; ?></div>
    <div>
        <p>
            Default sleeptime is 5 seconds.
        </p>
        <p>
            Options
            <ul>
                <li><b>rand</b> Randomize sleeptime between 1 and 60 seconds.</li>
                <li><b>sleeptime</b> Set the sleeptime</li>
            </ul>
        </p>
    <?php
        flush();
        sleep($sleeptime);
    ?>
  </body>
</html>

  
