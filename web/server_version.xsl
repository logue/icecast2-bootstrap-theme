<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>Server Information - Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <div class="container"> 
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="admin/">Administration</a></li>
          <li><a href="status.xsl">Server Status</a></li>
          <li class="active"><a href="server_version.xsl">Version</a></li>
        </ul>
        <h3 class="text-muted">Icecast Streaming Media Server</h3>
      </div>
      <!--end index header menu -->
      
      <xsl:for-each select="/icestats">
        <div class="panel panel-info">
          <div class="panel-heading">Server Information</div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-5">
                <dl class="dl-horizontal">
                  <dt>Location</dt>
                  <dd><xsl:value-of select="location" /></dd>
                  <dt>Admin</dt>
                  <dd><xsl:value-of select="admin" /></dd>
                  <dt>Host</dt>
                  <dd><xsl:value-of select="host" /></dd>
                  <dt>Version</dt>
                  <dd><xsl:value-of select="server_id" /></dd>
                </dl>
              </div>
              <div class="col-md-5">
                <dl class="dl-horizontal">
                  <dt>Download</dt>
                  <dd><a href="http://icecast.org/download.php" target="_blank">icecast.org</a></dd>
                  <dt>Subversion</dt>
                  <dd><a href="http://icecast.org/svn.php" target="_blank">click here</a></dd>
                  <dt>Documentation</dt>
                  <dd><a href="http://icecast.org/docs.php" target="_blank">click here</a></dd>
                  <dt>Stream Directory </dt>
                  <dd><a href="http://dir.xiph.org/index.php" target="_blank">dir.xiph.org</a></dd>
                  <dt>Community</dt>
                  <dd><a href="http://forum.icecast.org/" target="_blank">forum.icecast.org</a></dd>
                </dl>
              </div>
            </div>
          </div>
        </div>
      </xsl:for-each>
      <div class="footer">Support Icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
