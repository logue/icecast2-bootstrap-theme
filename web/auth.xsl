<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats">
    <html>
    <head>
    <title>Administration - Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    </head>

    <body>
    <div class="container"> 
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="admin/">Administration</a></li>
          <li><a href="status.xsl">Server Status</a></li>
          <li><a href="server_version.xsl">Version</a></li>
        </ul>
        <h3 class="text-muted">Icecast Streaming Media Server</h3>
      </div>
      <!--end index header menu -->

      <xsl:for-each select="source">
        <xsl:if test="authenticator">
          <div class="panel panel-default">
            <div class="panel-heading">
              <xsl:if test="server_name">
                <xsl:value-of select="server_name" />
              </xsl:if>
              (<xsl:value-of select="@mount" />)
            </div>
            <div class="panel-body">
              <form method="GET" action="/admin/buildm3u" class="form-inline" role="form">
                <input type="hidden" name="mount" value="{@mount}" />
                <div class="form-group">
                  <label class="sr-only" for="username">Username</label>
                  <input type="text" name="username" id="username" placeholder="Username" class="form-control" />
                </div>
                <div class="form-group">
                  <label class="sr-only" for="password">Password</label>
                  <input type="password" name="password" placeholder="Password" class="form-control" />
                </div>
                <button type="submit" class="btn btn-default">Login</button>
              </form>
            </div>
          </div>
        </xsl:if>
      </xsl:for-each>
      <div class="footer">Support Icecast development at <a target="_blank" href="http://www.icecast.org">www.icecast.org</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
