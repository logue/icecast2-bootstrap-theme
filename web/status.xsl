<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html" />
  <xsl:template match="/icestats">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="h-100" data-bs-theme="auto">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
        <meta name="theme-color" content="#001826" />
        <title>Icecast Streaming Media Server</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha256-MBffSnbbXwHCuZtgPYiwMQbfE7z+GOZ7fBPCNB06Z98=" crossorigin="anonymous" />
        <link href="/assets/style.css" rel="stylesheet" />
        <link href="/status-json.xsl" rel="alternate" type="application/json" />
      </head>

      <body class="d-flex flex-column h-100">
        <!-- Icons -->
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
          <!-- mount point icon -->
          <symbol id="bi-file-earmark-music" viewBox="0 0 16 16">
            <path d="M11 6.64a1 1 0 0 0-1.243-.97l-1 .25A1 1 0 0 0 8 6.89v4.306A2.572 2.572 0 0 0 7 11c-.5 0-.974.134-1.338.377-.36.24-.662.628-.662 1.123s.301.883.662 1.123c.364.243.839.377 1.338.377.5 0 .974-.134 1.338-.377.36-.24.662-.628.662-1.123V8.89l2-.5V6.64z" />
            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
          </symbol>
          <symbol id="bi-music-note-list" viewBox="0 0 16 16">
            <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z" />
            <path fill-rule="evenodd" d="M12 3v10h-1V3h1z" />
            <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z" />
            <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z" />
          </symbol>
          <symbol id="bi-filetype-xml" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM3.527 11.85h-.893l-.823 1.439h-.036L.943 11.85H.012l1.227 1.983L0 15.85h.861l.853-1.415h.035l.85 1.415h.908l-1.254-1.992 1.274-2.007Zm.954 3.999v-2.66h.038l.952 2.159h.516l.946-2.16h.038v2.661h.715V11.85h-.8l-1.14 2.596h-.025L4.58 11.85h-.806v3.999h.706Zm4.71-.674h1.696v.674H8.4V11.85h.791v3.325Z" />
          </symbol>
          <symbol id="bi-tv" viewBox="0 0 16 16">
            <path d="M2.5 13.5A.5.5 0 0 1 3 13h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zM13.991 3l.024.001a1.46 1.46 0 0 1 .538.143.757.757 0 0 1 .302.254c.067.1.145.277.145.602v5.991l-.001.024a1.464 1.464 0 0 1-.143.538.758.758 0 0 1-.254.302c-.1.067-.277.145-.602.145H2.009l-.024-.001a1.464 1.464 0 0 1-.538-.143.758.758 0 0 1-.302-.254C1.078 10.502 1 10.325 1 10V4.009l.001-.024a1.46 1.46 0 0 1 .143-.538.758.758 0 0 1 .254-.302C1.498 3.078 1.675 3 2 3h11.991zM14 2H2C0 2 0 4 0 4v6c0 2 2 2 2 2h12c2 0 2-2 2-2V4c0-2-2-2-2-2z" />
          </symbol>
          <symbol id="bi-filetype-json" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M14 4.5V11h-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM4.151 15.29a1.176 1.176 0 0 1-.111-.449h.764a.578.578 0 0 0 .255.384c.07.049.154.087.25.114.095.028.201.041.319.041.164 0 .301-.023.413-.07a.559.559 0 0 0 .255-.193.507.507 0 0 0 .084-.29.387.387 0 0 0-.152-.326c-.101-.08-.256-.144-.463-.193l-.618-.143a1.72 1.72 0 0 1-.539-.214 1.001 1.001 0 0 1-.352-.367 1.068 1.068 0 0 1-.123-.524c0-.244.064-.457.19-.639.128-.181.304-.322.528-.422.225-.1.484-.149.777-.149.304 0 .564.05.779.152.217.102.384.239.5.41.12.17.186.359.2.566h-.75a.56.56 0 0 0-.12-.258.624.624 0 0 0-.246-.181.923.923 0 0 0-.37-.068c-.216 0-.387.05-.512.152a.472.472 0 0 0-.185.384c0 .121.048.22.144.3a.97.97 0 0 0 .404.175l.621.143c.217.05.406.12.566.211a1 1 0 0 1 .375.358c.09.148.135.335.135.56 0 .247-.063.466-.188.656a1.216 1.216 0 0 1-.539.439c-.234.105-.52.158-.858.158-.254 0-.476-.03-.665-.09a1.404 1.404 0 0 1-.478-.252 1.13 1.13 0 0 1-.29-.375Zm-3.104-.033a1.32 1.32 0 0 1-.082-.466h.764a.576.576 0 0 0 .074.27.499.499 0 0 0 .454.246c.19 0 .33-.055.422-.164.091-.11.137-.265.137-.466v-2.745h.791v2.725c0 .44-.119.774-.357 1.005-.237.23-.565.345-.985.345a1.59 1.59 0 0 1-.568-.094 1.145 1.145 0 0 1-.407-.266 1.14 1.14 0 0 1-.243-.39Zm9.091-1.585v.522c0 .256-.039.47-.117.641a.862.862 0 0 1-.322.387.877.877 0 0 1-.47.126.883.883 0 0 1-.47-.126.87.87 0 0 1-.32-.387 1.55 1.55 0 0 1-.117-.641v-.522c0-.258.039-.471.117-.641a.87.87 0 0 1 .32-.387.868.868 0 0 1 .47-.129c.177 0 .333.043.47.129a.862.862 0 0 1 .322.387c.078.17.117.383.117.641Zm.803.519v-.513c0-.377-.069-.701-.205-.973a1.46 1.46 0 0 0-.59-.63c-.253-.146-.559-.22-.916-.22-.356 0-.662.074-.92.22a1.441 1.441 0 0 0-.589.628c-.137.271-.205.596-.205.975v.513c0 .375.068.699.205.973.137.271.333.48.589.626.258.145.564.217.92.217.357 0 .663-.072.917-.217.256-.146.452-.355.589-.626.136-.274.205-.598.205-.973Zm1.29-.935v2.675h-.746v-3.999h.662l1.752 2.66h.032v-2.66h.75v4h-.656l-1.761-2.676h-.032Z"/>
          </symbol>
          <!-- header icon -->
          <symbol id="bi-speedometer" viewBox="0 0 16 16">
            <path d="M8 2a.5.5 0 0 1 .5.5V4a.5.5 0 0 1-1 0V2.5A.5.5 0 0 1 8 2zM3.732 3.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 8a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 7.31A.91.91 0 1 0 8.85 8.569l3.434-4.297a.389.389 0 0 0-.029-.518z" />
            <path fill-rule="evenodd" d="M6.664 15.889A8 8 0 1 1 9.336.11a8 8 0 0 1-2.672 15.78zm-4.665-4.283A11.945 11.945 0 0 1 8 10c2.186 0 4.236.585 6.001 1.606a7 7 0 1 0-12.002 0z" />
          </symbol>
        </svg>

        <!-- index header menu -->
        <header>
          <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="/">
                <img src="/assets/img/icecast.png" width="32" height="32" class="me-3" alt="Icecast" />
                Icecast Streaming Media Server
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto mr-0 mb-2 mb-md-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="status.xsl">Server Status</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="server_version.xsl">Version</a>
                  </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                  <li class="nav-item">
                    <a class="nav-link" href="admin/">
                      <svg width="1em" height="1em" class="bi">
                        <use href="#bi-speedometer" />
                      </svg>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </header>
        <!-- end index header menu -->

        <xsl:text disable-output-escaping="yes">
          &lt;!-- WARNING:
          DO NOT ATTEMPT TO PARSE ICECAST HTML OUTPUT!
          The web interface may change completely between releases.
          If you have a need for automatic processing of server data,
          please read the appropriate documentation. Latest docs:
          https://icecast.org/docs/icecast-latest/icecast2_stats.html
          --&gt;
        </xsl:text>
        <main class="flex-shrink-0">
          <div class="container">
            <h1 class="mt-3 d-flex justify-content-between">
              <span>Mount Point Status</span>
              <span>
                <a href="/status-json.xsl" class="btn btn-info" role="button" data-bs-toggle="tooltip" title="JSON status">
                  <svg width="1em" height="1em" class="bi">
                    <use href="#bi-filetype-json" />
                  </svg>
                </a>
              </span>
            </h1>
            <!--mount point stats-->
            <xsl:choose>
              <xsl:when test="source">
                <xsl:for-each select="source">
                  <div class="card my-3">
                    <xsl:choose>
                      <xsl:when test="listeners">
                        <h2 class="card-header">Mount Point
                          <var>
                            <xsl:value-of select="@mount" />
                          </var>
                        </h2>
                        <div class="card-body">
                          <div class="d-flex justify-content-between">
                            <div class="audioplayer">
                              <audio controls="controls" preload="none">
                                <source src="{@mount}" type="{server_type}" />
                              </audio>
                            </div>
                            <table class="table">
                              <tbody>
                                <xsl:if test="server_name">
                                  <tr>
                                    <th scope="row">Stream Name:</th>
                                    <td>
                                      <xsl:value-of select="server_name" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="server_description">
                                  <tr>
                                    <th scope="row">Stream Description:</th>
                                    <td>
                                      <xsl:value-of select="server_description" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="server_type">
                                  <tr>
                                    <th scope="row">Content Type:</th>
                                    <td>
                                      <xsl:value-of select="server_type" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="stream_start">
                                  <tr>
                                    <th scope="row">Stream started:</th>
                                    <td>
                                      <xsl:value-of select="stream_start" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="bitrate">
                                  <tr>
                                    <th scope="row">Bitrate:</th>
                                    <td>
                                      <xsl:value-of select="bitrate" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="quality">
                                  <tr>
                                    <th scope="row">Quality:</th>
                                    <td>
                                      <xsl:value-of select="quality" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="video_quality">
                                  <tr>
                                    <th scope="row">Video Quality:</th>
                                    <td>
                                      <xsl:value-of select="video_quality" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="frame_size">
                                  <tr>
                                    <th scope="row">Framesize:</th>
                                    <td>
                                      <xsl:value-of select="frame_size" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="frame_rate">
                                  <tr>
                                    <th scope="row">Framerate:</th>
                                    <td>
                                      <xsl:value-of select="frame_rate" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="listeners">
                                  <tr>
                                    <th scope="row">Listeners (current):</th>
                                    <td>
                                      <xsl:value-of select="listeners" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="listener_peak">
                                  <tr>
                                    <th scope="row">Listeners (peak):</th>
                                    <td>
                                      <xsl:value-of select="listener_peak" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="genre">
                                  <tr>
                                    <th scope="row">Genre:</th>
                                    <td>
                                      <xsl:value-of select="genre" />
                                    </td>
                                  </tr>
                                </xsl:if>
                                <xsl:if test="server_url">
                                  <tr>
                                    <th scope="row">Stream URL:</th>
                                    <td class="streamstats">
                                      <a href="{server_url}">
                                        <xsl:value-of select="server_url" />
                                      </a>
                                    </td>
                                  </tr>
                                </xsl:if>
                                <tr>
                                  <th scope="row">Currently playing:</th>
                                  <td>
                                    <xsl:if test="artist">
                                      <xsl:value-of select="artist" />
                                      -
                                    </xsl:if>
                                    <xsl:value-of select="title" />
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                        <div class="card-footer text-end">
                          <div class="btn-group" role="group" aria-label="Stream Format">
                            <xsl:choose>
                              <xsl:when test="authenticator">
                                <a href="/auth.xsl" class="btn btn-warning btn-sm" role="button">
                                  <svg class="bi">
                                    <use href="#bi-box-arrow-in-right" />
                                  </svg>Login
                                </a>
                              </xsl:when>
                              <xsl:otherwise>
                                <a href="{@mount}.m3u" class="btn btn-outline-primary btn-sm" role="button">
                                  <svg class="bi mr-3">
                                    <use href="#bi-file-earmark-music" />
                                  </svg>.m3u
                                </a>
                                <a href="{@mount}.pls" class="btn btn-outline-primary btn-sm" role="button">
                                  <svg class="bi mr-3">
                                    <use href="#bi-music-note-list" />
                                  </svg>.pls
                                </a>
                                <a href="{@mount}.xspf" class="btn btn-outline-primary btn-sm" role="button">
                                  <svg class="bi mr-3">
                                    <use href="#bi-filetype-xml" />
                                  </svg>
                                  <abbr data-bs-toggle="tooltip" title="XML Shareable Playlist Format">.xspf</abbr>
                                </a>
                                <a href="{@mount}.vclt" class="btn btn-outline-primary btn-sm" role="button">
                                  <svg class="bi mr-3">
                                    <use href="#bi-filetype-xml" />
                                  </svg>
                                  <abbr data-bs-toggle="tooltip" title="Vorbis Comment Like Text">VCLT</abbr>
                                </a>
                              </xsl:otherwise>
                            </xsl:choose>
                          </div>
                        </div>
                      </xsl:when>
                      <xsl:otherwise>
                        <h1 class="card-header">
                          <var>
                            <xsl:value-of select="@mount" />
                          </var> - Not Connected
                        </h1>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <div class="alert alert-info" role="alert">No active mount points.</div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </main>

        <footer class="footer mt-auto py-3 bg-body-tertiary">
          <div class="container">
            <span class="text-body-secondary">Support icecast development at
              <a href="https://www.icecast.org/">www.icecast.org</a>
              /
              <a href="https://github.com/logue/icecast2-bootstrap-theme">Icecast bootstrap theme</a> by
              <a href="https://logue.dev">Logue</a>
            </span>
          </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha256-gvZPYrsDwbwYJLD5yeBfcNujPhRoGOY831wwbIzz3t0=" crossorigin="anonymous"></script>
        <script src="/assets/scripts.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
