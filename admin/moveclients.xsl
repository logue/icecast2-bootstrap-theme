<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="/style.css" />
    </head>
    <body>
    <div class="container"> 
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="stats.xsl">Admin Home</a></li>
          <li><a href="listmounts.xsl">Mountpoint List</a></li>
          <li><a href="/status.xsl">Public Home</a></li>
        </ul>
        <h3 class="text-muted">Icecast2 Admin</h3>
      </div>
      <!--end index header menu -->

      <xsl:variable name = "currentmount" ><xsl:value-of select="current_source" /></xsl:variable>
      <h2>Moving listeners from <xsl:value-of select="current_source" /></h2>
      <div class="panel panel-warning">
        <div class="panel-heading">Move to which mountpoint?</div>
        <div class="panel-body">
          <xsl:for-each select="source">
            <p>Move from <code><xsl:copy-of select="$currentmount" /></code> to <code><xsl:value-of select="@mount" /></code><br />
              <xsl:value-of select="listeners" /> listeners<br />
              <a href="moveclients.xsl?mount={$currentmount}&amp;destination={@mount}">Move clients</a></p>
          </xsl:for-each>
        </div>
      </div>
      <div class="footer">Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>