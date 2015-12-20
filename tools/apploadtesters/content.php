<?php
    if (isset($_GET['rand']) && $_GET['rand'] == '1')
    {
        $length = rand(1, 6000);
    }
    else if (isset($_GET['length']) && $_GET['length'] > 0)
    {
        $length = $_GET['length'];
    }
    else
    {
        $length = 1000;
    }
    
    function generate($chars){
        $lineLength = 80;
        $startChar  = 32;
        $endChar    = 126;
        
        $content = '';
        $contentCount = 0;
        
        for ($i=0; $i < $chars; $i++){
            $c = chr(rand($startChar, $endChar));
            $content .= $c;
            $contentCount++;
            if (($contentCount % $lineLength) == 0){
                $content .= "\n";
            }
        }
        
        return $content;
    }
?>    
<html>
  <head>
    <script>
      
    </script>
  </head>
  <body>
    <div><?php echo date(DATE_RFC822) . " at " . gethostname(); ?></div>
    <div>Generating <?php echo $length; ?> characters</div>
    <pre><?php echo htmlentities(generate($length)); ?></pre>
  </body>
</html>

  
