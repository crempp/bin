<?php
    if (isset($_GET['rand']) && $_GET['rand'] == '1')
    {
        $precision = rand(1, 6000);
    }
    else if (isset($_GET['precision']) && $_GET['precision'] > 0)
    {
        $precision = $_GET['precision'];
    }
    else
    {
        $precision = 500;
    }

    function bcpi($precision){
        $limit = ceil(log($precision)/log(2))-1;
        bcscale($precision+6);
        $a = 1;
        $b = bcdiv(1,bcsqrt(2));
        $t = 1/4;
        $p = 1;
        while($n < $limit){
            $x = bcdiv(bcadd($a,$b),2);
            $y = bcsqrt(bcmul($a, $b));
            $t = bcsub($t, bcmul($p,bcpow(bcsub($a,$x),2)));
            $a = $x;
            $b = $y;
            $p = bcmul(2,$p);
            ++$n;
        }
        return bcdiv(bcpow(bcadd($a, $b),2),bcmul(4,$t),$precision);
    }
?>    
<html>
  <head>
    <script>
      
    </script>
  </head>
  <body>
    <div><?php echo date(DATE_RFC822) . " at " . gethostname(); ?></div>
    <div>Calculating pi to a precision of <?php echo $precision; ?></div>
    <div style="width: 700px; word-wrap:break-word;">
        
        <?php
            flush();
            echo bcpi($precision);
        ?>
    </div>
  </body>
</html>

  
