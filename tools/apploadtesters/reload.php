<html>
  <head>
    <script>
      RELOAD = false;
      RELOAD_TIME = 1000;
      
      function setCookie(c_name,value,exdays) {
        var exdate=new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
        document.cookie=c_name + "=" + c_value;
      }
      
      function getCookie(c_name) {
        var i,x,y,ARRcookies=document.cookie.split(";");
        for (i=0;i<ARRcookies.length;i++) {
          x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
          y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
          x=x.replace(/^\s+|\s+$/g,"");
          if (x==c_name) {
            return unescape(y);
          }
        }
      }
      
      function pageReload(){
        location.reload();
      }
      
      function toggleReload(){
        RELOAD = !RELOAD;
        setCookie("reload", RELOAD, 1);
        var toggleLink = document.getElementById('reload');
        toggleLink.innerHTML = RELOAD ? "on" : "off";
      }

      function pageReloadTask(){
	//alert("reload task "+RELOAD);
        if (RELOAD) {
          pageReload();
        }
      }
      
      RELOAD = getCookie("reload");
      
      if (RELOAD == null) {
        RELOAD = false
        setCookie("reload", RELOAD, 1);
      } else {
        RELOAD = (RELOAD == 'true') ? true : false;
      }
      setInterval(pageReloadTask, RELOAD_TIME);
    </script>
  </head>
  <body>
    <div><?php echo date(DATE_RFC822) . " at " . gethostname(); ?></div>
    <div><a href="#" onclick="pageReload(); return false;">reload</a></div>
    <div>Reload is <span id="reload">off</span> <a href="#" onclick="toggleReload(); return false;">toggle</a></div>
    <script>
      var toggleLink = document.getElementById('reload');
      toggleLink.innerHTML = RELOAD ? "on" : "off";
    </script>
  </body>
</html>

  
