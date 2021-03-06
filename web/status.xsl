<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>Icecast Streaming Media Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <div class="container">
      <!--index header menu -->
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="admin/">Administration</a></li>
          <li class="active"><a href="status.xsl">Server Status</a></li>
          <li><a href="server_version.xsl">Version</a></li>
        </ul>
        <h3 class="text-muted">Icecast Streaming Media Server</h3>
      </div>
      <!--end index header menu --> 

      <!--mount point stats-->
      <xsl:for-each select="source">
        <xsl:choose>
          <xsl:when test="listeners">
            <div class="panel panel-default" id="">
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
                <dl class="dl-horizontal">
                  <xsl:if test="server_name">
                    <dt>Title:</dt>
                    <dd><xsl:value-of select="server_name" /></dd>
                  </xsl:if>
                  <xsl:if test="server_description">
                    <dt>Description:</dt>
                    <dd><xsl:value-of select="server_description" /></dd>
                  </xsl:if>
                  <xsl:if test="genre">
                    <dt>Genre:</dt>
                    <dd><xsl:value-of select="genre" /></dd>
                  </xsl:if>
                  <xsl:if test="stream_start">
                    <dt>Started:</dt>
                    <dd><xsl:value-of select="stream_start" /></dd>
                  </xsl:if>
                  <xsl:if test="server_type">
                    <dt>Content Type:</dt>
                    <dd><xsl:value-of select="server_type" /></dd>
                  </xsl:if>
                  <xsl:if test="bitrate">
                    <dt>Bitrate:</dt>
                    <dd><xsl:value-of select="bitrate" /></dd>
                  </xsl:if>
                  <xsl:if test="quality">
                    <dt>Quality:</dt>
                    <dd><xsl:value-of select="quality" /></dd>
                  </xsl:if>
                  <xsl:if test="video_quality">
                    <dt>Video Quality:</dt>
                    <dd><xsl:value-of select="video_quality" /></dd>
                  </xsl:if>
                  <xsl:if test="frame_size">
                    <dt>Framesize:</dt>
                    <dd><xsl:value-of select="frame_size" /></dd>
                  </xsl:if>
                  <xsl:if test="frame_rate">
                    <dt>Framerate:</dt>
                    <dd><xsl:value-of select="frame_rate" /></dd>
                  </xsl:if>
                  <xsl:if test="listeners">
                    <dt>Listeners:</dt>
                    <dd><xsl:value-of select="listeners" /></dd>
                  </xsl:if>
                  <xsl:if test="listener_peak">
                    <dt>Peak Listeners:</dt>
                    <dd><xsl:value-of select="listener_peak" /></dd>
                  </xsl:if>
                  <xsl:if test="listener_peak">
                    <dt>Stream URL:</dt>
                    <dd><a target="_blank" href="{server_url}"><xsl:value-of select="server_url" /></a></dd>
                  </xsl:if>
                  <xsl:if test="listener_peak">
                    <dt>Current Song:</dt>
                    <dd><xsl:if test="artist">
                        <xsl:value-of select="artist" /> -
                      </xsl:if>
                      <xsl:value-of select="title" /></dd>
                  </xsl:if>
                </dl>
              </div>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <p><xsl:value-of select="@mount" /> - Not Connected</p>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
      <div class="footer">Support icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a></div>
    </div>
    <script src="//code.jquery.com/jquery-latest.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>/*<![CDATA[*/
    $('*[title]').tooltip();
    /*]]>*/</script>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>