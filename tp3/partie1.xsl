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
                <xsl:apply-templates select="country[city]"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <div class="card" style="width: 25rem; border: 1px solid tomato;">
            <div class="card-body">
                <h3 class="card-title">Pays :  <xsl:value-of select="@name" /></h3>
                <table class="table">
                    <tr>
                        <th scope="col">Population</th>
                        <th scope="col">Superficie</th>
                    </tr>
                    <tr>
                        <td class="card-text">
                            <xsl:value-of select="@population"></xsl:value-of> d'hab
                        </td>
                        <td class="card-text">
                            <xsl:value-of select="@area"></xsl:value-of> m2
                        </td>
                    </tr>
                </table>
                <br />
                <xsl:apply-templates select="city"/>
            </div>
            <br />
        </div>
        <br />
    </xsl:template>

    <!--<xsl:template match="country">
        <xsl:value-of select="@population" />
        <br />
    </xsl:template>-->

    <xsl:template match="city">
        <p>ville : <xsl:value-of select="name"/></p>
        <p>+ <xsl:value-of select="population" /> hab.</p>
        <p>+ <xsl:apply-templates/><xsl:value-of select="@percentage" />%</p>
    </xsl:template>

</xsl:stylesheet>



<!--
<xsl:apply-templates
select="country[city][position()&lt; 10]">
<xsl:sort select="@name" order="ascending" /> &lt;!&ndash; //descending &ndash;&gt;
</xsl:apply-templates>-->
