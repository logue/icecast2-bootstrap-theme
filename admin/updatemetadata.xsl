<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
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

      <h2>Update Metadata</h2>
      <xsl:for-each select="source">
        <div class="panel panel-info">
          <div class="panel-heading">Mountpoint <xsl:value-of select="@mount" />
            <xsl:if test="server_name">
              <small><xsl:value-of select="server_name" /></small>
            </xsl:if>
          </div>
          <div class="panel-body">
            <form action="/admin/metadata.xsl"  method="get" role="form">
              <input type="hidden" name="mount" value="{@mount}" />
              <input type="hidden" name="mode" value="updinfo" />
              <input type="hidden" name="charset" value="UTF-8" />
              <div class="input-group">
                <label for="song" class="input-group-addon">Metadata:</label>
                <input type="text" id="song" name="song" class="form-control" />
                <div class="input-group-btn">
                  <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span>Update</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </xsl:for-each>
      <div class="footer">Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>