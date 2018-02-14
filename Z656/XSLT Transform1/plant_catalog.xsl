<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Plant Catalog</title>
                <link rel="stylesheet" type="text/css" href="css/main.css"/>
            </head>        
        <body>
            <div id="banner_image">
                <h1 id="plant_store">Bo Tany&apos;s House of Plants</h1>
            </div>
            <div>
                <p>We have the best selection of plants at the best prices! Check out our catalog
                    below!</p>
                
            </div>
            <div id="home">
                <h2>Catalog</h2>
            </div>
            <div>
                <nav>
                    <ul>
                        <li>Choose view:</li>
                        <li>
                            <a href="#common_sort">by Name</a>
                        </li>
                        <li>
                            <a href="#price_sort">by Price</a>
                        </li>
                        <li>
                            <a href="#zone_sort">by Zone</a>
                        </li>
                        <li>
                            <a href="#light_sort">by Light</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div>
                <table id="common_sort">
                    <tr>
                        <th>Common Name</th>
                        <th>Botanical Name</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="COMMON"/>
                        <tr>
                            <td>
                                <xsl:value-of select="COMMON"/>
                            </td>
                            <td>
                                <xsl:value-of select="BOTANICAL"/>
                            </td>

                            <td>
                                <xsl:value-of select="ZONE"/>
                            </td>
                            <td>
                                <xsl:value-of select="LIGHT"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRICE"/>
                            </td>
                            <td>
                                <xsl:value-of select="AVAILABILITY"/>
                            </td>
                        </tr>
                    </xsl:for-each>                   
                 </table>
                <a href="#home">Back to top</a>
            </div>
            <div>
                <table id="price_sort">
                    <tr>
                        <th>Common Name</th>
                        <th>Botanical Name</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="PRICE"/>
                        <tr>
                            <td>
                                <xsl:value-of select="COMMON"/>
                            </td>
                            <td>
                                <xsl:value-of select="BOTANICAL"/>
                            </td>

                            <td>
                                <xsl:value-of select="ZONE"/>
                            </td>
                            <td>
                                <xsl:value-of select="LIGHT"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRICE"/>
                            </td>
                            <td>
                                <xsl:value-of select="AVAILABILITY"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <a href="#home">Back to top</a>
            </div>
            <div>
                <table id="zone_sort">
                    <tr>
                        <th>Common Name</th>
                        <th>Botanical Name</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="ZONE"/>
                        <tr>
                            <td>
                                <xsl:value-of select="COMMON"/>
                            </td>
                            <td>
                                <xsl:value-of select="BOTANICAL"/>
                            </td>

                            <td>
                                <xsl:value-of select="ZONE"/>
                            </td>
                            <td>
                                <xsl:value-of select="LIGHT"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRICE"/>
                            </td>
                            <td>
                                <xsl:value-of select="AVAILABILITY"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <a href="#home">Back to top</a>
            </div>
            <div>
                <table id="light_sort">
                    <tr>
                        <th>Common Name</th>
                        <th>Botanical Name</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="LIGHT"/>
                        <tr>
                            <td>
                                <xsl:value-of select="COMMON"/>
                            </td>
                            <td>
                                <xsl:value-of select="BOTANICAL"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="ZONE"/>
                            </td>
                            <td>
                                <xsl:value-of select="LIGHT"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRICE"/>
                            </td>
                            <td>
                                <xsl:value-of select="AVAILABILITY"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <a href="#home">Back to top</a>
            </div>
        </body> 
        </html>
    </xsl:template>
</xsl:stylesheet>
