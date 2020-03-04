<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="countries">
        <html>
            <head><title>pays</title></head>
            <body>

                <xsl:apply-templates/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <p>
            J'ai rencontré un pays :
            <xsl:value-of select="@name"/>
        </p>
    </xsl:template>

</xsl:stylesheet>