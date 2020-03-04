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
        <h2>
           + J'ai rencontré un pays : <xsl:value-of select="@name"/>
        </h2>
        <ul>
            <li> Population : <xsl:value-of select="@name"/>
            </li>
            <li> Superficie : <xsl:value-of select="@name"/>
            </li>
        </ul>
    <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="city">
        <p>ville : <xsl:value-of select="@name"/>
            (<xsl:value-of select="population" /> hab.)
        </p>
    </xsl:template>

</xsl:stylesheet>