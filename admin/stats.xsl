<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html" />
  <xsl:template match="/icestats" >
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Icecast Streaming Media Server</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha512-Dop/vW3iOtayerlYAqCgkVr2aTr2ErwwTYOvRFUpzl2VhCMJyjQF0Q9TjUXIo6JhuM/3i0vVEt2e/7QQmnHQqw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha512-iy8EXLW01a00b26BaqJWaCmk9fJ4PsMdgNRqV96KwMPSH+blO82OHzisF/zQbRIIi8m0PiO10dpS0QxrcXsisw==" crossorigin="anonymous" referrerpolicy="no-referrer" id="theme" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

          <!--global server stats-->
          <div class="panel panel-info">
            <div class="panel-heading">Global Server Stats</div>
            <div class="panel-body">
              <dl class="dl-horizontal">
                <xsl:for-each select="/icestats">
                  <xsl:for-each select="*">
                    <xsl:if test = "name()!='source'">
                      <dt><xsl:value-of select="name()" /></dt>
                      <dd><xsl:value-of select="." /></dd>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:for-each>
              </dl>
            </div>
          </div>
          <!--end global server stats-->

          <!--mount point stats-->
          <xsl:for-each select="source">
            <xsl:if test = "listeners!=''">
              <div class="panel panel-default">
                <div class="panel-heading">
                  Mount Point <var><xsl:value-of select="@mount" /></var>
                  <div class="pull-right">
                    <xsl:choose>
                      <xsl:when test="authenticator">
                        <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span>Login</a>
                      </xsl:when>
                      <xsl:otherwise>
                        <div class="btn-group" role="group" aria-label="Stream Format">
                          <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-audio-o"></span>.m3u</a>
                          <a href="{@mount}.pls" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-text-o"></span>.pls</a>
                          <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-code-o"></span><abbr title="XML Shareable Playlist Format">.xspf</abbr></a>
                          <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="fa fa-file-o"></span><abbr title="Vorbis Comment Like Text">VCLT</abbr></a>
                        </div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                </div>
                <div class="panel-body">
                  <div class="btn-group" role="group" aria-label="Manage stream">
                    <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span>List Clients</a>
                    <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span>Move Listeners</a>
                    <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span>Update Metadata</a>
                    <xsl:if test="authenticator">
                      <a href="manageauth.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span>Manage Authentication</a>
                    </xsl:if>
                    <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Kill Source</a>
                  </div>
                  <dl class="dl-horizontal">
                    <xsl:for-each select="*">
                      <dt><xsl:value-of select="name()" /></dt>
                      <dd><xsl:value-of select="." /></dd>
                    </xsl:for-each>
                  </dl>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
          <!--end mount point stats-->

          <div class="footer">Support icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a>.</div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha512-oBTprMeNEKCnqfuqKd6sbvFzmFQtlXS3e0C/RGFV0hD6QzhHV+ODfaQbAlmY6/q0ubbwlAM/nCJjkrgA3waLzg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>/*<![CDATA[*/
    $('*[title]').tooltip();
    /*]]>*/</script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
