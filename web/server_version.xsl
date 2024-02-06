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
      </head>
      <body class="d-flex flex-column h-100">
        <!-- Icons -->
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
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
                <ul class="navbar-nav ml-0 mr-auto mb-2 mb-md-0">
                  <li class="nav-item">
                    <a class="nav-link" href="status.xsl">Server Status</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="server_version.xsl">Version</a>
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
        <main class="flex-shrink-0">
          <div class="container">
            <h1 class="mt-3">Server Information</h1>
            <table class="table">
              <tbody>
                <xsl:for-each select="/icestats">
                  <tr>
                    <th scope="row">Location</th>
                    <td>
                      <xsl:value-of select="location" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Admin</th>
                    <td>
                      <xsl:value-of select="admin" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Host</th>
                    <td>
                      <xsl:value-of select="host" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Version</th>
                    <td>
                      <xsl:value-of select="server_id" />
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <th scope="row">Download</th>
                  <td>
                    <a href="https://icecast.org/download/">icecast.org</a>
                  </td>
                </tr>
                <tr>
                  <th scope="row">Source code</th>
                  <td>
                    <a href="https://icecast.org/download/#git">icecast.org/download/#git</a>
                  </td>
                </tr>
                <tr>
                  <th scope="row">Documentation</th>
                  <td>
                    <a href="https://icecast.org/docs/">icecast.org/docs</a>
                  </td>
                </tr>
                <tr>
                  <th scope="row">Stream Directory</th>
                  <td>
                    <a href="https://dir.xiph.org/">dir.xiph.org</a>
                  </td>
                </tr>
                <tr>
                  <th scope="row">Community</th>
                  <td>
                    <a href="https://icecast.org/contact/">icecast.org/contact</a>
                  </td>
                </tr>
              </tbody>
            </table>
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
