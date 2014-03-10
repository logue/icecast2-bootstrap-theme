<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
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

      <h2>Listener Stats</h2>
      <xsl:for-each select="source">
        <div class="panel panel-default">
          <div class="panel-heading">
            Mountpoint <var><xsl:value-of select="@mount" /></var>
            <div class="pull-right">
              <xsl:choose>
                <xsl:when test="authenticator">
                  <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span>Login</a>
                </xsl:when>
                <xsl:otherwise>
                  <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span>.m3u</a>
                  <a href="{@mount}.pls" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span>.pls</a>
                  <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span><abbr title="XML Shareable Playlist Format">.xspf</abbr></a>
                  <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span><abbr title="Vorbis Comment Like Text">VCLT</abbr></a>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="panel-body">
            <div>
              <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span>List Clients</a>
              <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span>Move Listeners</a>
              <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span>Update Metadata</a>
              <xsl:if test="authenticator">
                <a href="manageauth.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span>Manage Authentication</a>
              </xsl:if>
              <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Kill Source</a>
            </div>
            <xsl:choose>
              <xsl:when test="listener">
                <table class="table">
                  <thead>
                    <tr>
                      <th>IP</th>
                      <th>Sec. connected</th>
                      <th>User Agent</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:variable name = "themount"><xsl:value-of select="@mount" /></xsl:variable>
                    <xsl:for-each select="listener">
                      <tr>
                        <td><xsl:value-of select="IP" />
                          <xsl:if test="username">
                            (<xsl:value-of select="username" />)
                          </xsl:if></td>
                        <td><xsl:value-of select="Connected" /></td>
                        <td><xsl:value-of select="UserAgent" /></td>
                        <td><a href="killclient.xsl?mount={$themount}&amp;id={ID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span>Kick</a></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </xsl:when>
              <xsl:otherwise>
                <p class="alert alert-warning">No listeners connected</p>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </xsl:for-each>
      <div class="footer">Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a></div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>