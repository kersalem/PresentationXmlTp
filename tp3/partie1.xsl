<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:template match="countries">
        <html>
            <head>
                <title>Partie 1</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            </head>
            <body>
                <xsl:apply-templates
                    select="country[city][position()&lt; 10]">
                    <xsl:sort select="@name" order="ascending" /> <!-- //descending -->
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <div class="card" style="width: 18rem; border: 1px solid tomato;">
            <h5 class="card-title"><xsl:value-of select="@name"/></h5>
        </div>
    </xsl:template>

</xsl:stylesheet>