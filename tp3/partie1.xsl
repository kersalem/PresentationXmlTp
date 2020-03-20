<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:template match="countries">
        <html>
            <head>
                <title>Partie 1</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
                      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                      crossorigin="anonymous"/>
            </head>
            <body>
                <xsl:apply-templates select="country[city]"/>
            </body>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                    crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                    crossorigin="anonymous"/>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                    crossorigin="anonymous"/>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <div class="card" style="width: 25rem;">
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
                            <xsl:value-of select="@area"></xsl:value-of> km2
                        </td>
                    </tr>
                </table>
                <br />
                <xsl:apply-templates select="city"/>
                <br />
                <xsl:apply-templates select="city[position()&lt; 3]" style="background:red;"/>
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
        <p><b>ville : <xsl:value-of select="name"/></b></p>
        <p>+ <xsl:value-of select="population" /> hab.</p>
        <p>+ <xsl:apply-templates/><xsl:value-of select="@percentage" />%</p>
    </xsl:template>

</xsl:stylesheet>



<!--
<xsl:apply-templates
select="country[city][position()&lt; 10]">
<xsl:sort select="@name" order="ascending" /> &lt;!&ndash; //descending &ndash;&gt;
</xsl:apply-templates>-->
