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
                <div>
                    <a href="#country">Nom</a>
                    <a href="#population">Population</a>
                    <a href="#area">Superficie</a>
                </div>

                <div id="navigation">
                    <div id="country">
                        <p>Pays</p>
                        <xsl:apply-templates mode="nav">
                            <xsl:sort select="@country" order="descending"/>
                        </xsl:apply-templates>
                    </div>
                    <div id="country">
                        <p>Population</p>
                        <xsl:apply-templates select="country" mode="pop">
                            <xsl:sort select="@population" data-type="number"
                                      order="descending"/>
                        </xsl:apply-templates>
                    </div>
                    <div id="country">
                        <p>Area</p>
                        <xsl:apply-templates select="country" mode="area">
                            <xsl:sort select="@area" data-type="number"
                                      order="descending"/>
                        </xsl:apply-templates>
                    </div>
                </div>

                <xsl:apply-templates select="country"/>
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

    <!--  Card  -->
<!--    <xsl:template match="country">
        <div style="background:red;">
            <h3><xsl:value-of select="@name" /></h3>
        toto
        </div>

        <br />
    </xsl:template>-->

    <xsl:template match="country" mode="nav">
        <xsl:if test="position() &lt;= 10">
            <li>
               <a href="#{@name}">
                   <xsl:value-of select="@name"/>
               </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="country" mode="pop">
        <xsl:if test="position() &lt;= 10">
        <li>
            <a href="#{@name}">
                <b><xsl:value-of select="@name"/></b> :
                <xsl:value-of select="@population"/>
            </a>
        </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="country" mode="area">
        <xsl:if test="position() &lt;= 10">
            <li>
                <a href="#{@name}">
                    <b><xsl:value-of select="@name"/></b> :
                    <xsl:value-of select="@area"/>
                </a>
            </li>
        </xsl:if>
    </xsl:template>


<!--  Card  -->
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

<!--    <xsl:template match="city">
        <p><b>ville : <xsl:value-of select="name"/></b></p>
        <p>+ <xsl:value-of select="population" /> hab.</p>
        <p>+ <xsl:apply-templates/><xsl:value-of select="@percentage" />%</p>
    </xsl:template>-->

</xsl:stylesheet>



<!--
<xsl:apply-templates
select="country[city][position()&lt; 10]">
<xsl:sort select="@name" order="ascending" /> &lt;!&ndash; //descending &ndash;&gt;
</xsl:apply-templates>-->
