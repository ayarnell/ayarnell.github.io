<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- hides TEI header -->
    <xsl:template match="tei:TEI/tei:teiHeader"/>
    <xsl:template match="tei:TEI/tei:text">
        <html><head>
            <title>Placeography</title>
            <link rel="stylesheet" type="text/css" href="stylesheets/tacitus_test.css"/>
        </head> 
        <body>
            <nav>
                <ul>
                    <li>
                        <a href="index.html">About</a>
                    </li>
                    <li>
                        <a href="Sigla.html">Sigla</a>
                    </li>
                    <li>
                        <a href="textnav.html">Text</a>
                        <ul>
                            <li>
                                <a href="Part01.html">Part 1 (Ch. 1-9)</a>
                            </li>
                            <li>
                                <a href="Part02.html">Part 2 (Ch. 10-19)</a>
                            </li>
                            <li>
                                <a href="Part03.html">Part 3 (Ch. 20-29)</a>
                            </li>
                            <li>
                                <a href="Part04.html">Part 4 (Ch. 30-39)</a>
                            </li>
                            <li>
                                <a href="Part05.html">Part 5 (Ch. 40-49)</a>
                            </li>
                            <li>
                                <a href="Part06.html">Part 6 (Ch. 50-59)</a>
                            </li>
                            <li>
                                <a href="Part07.html">Part 7 (Ch. 60-69)</a>
                            </li>
                            <li>
                                <a href="Part08.html">Part 8 (Ch. 70-79)</a>
                            </li>
                            <li>
                                <a href="Part09.html">Part 9 (Ch. 80-90)</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="Personography.html">Personography</a>
                    </li>
                    <li>
                        <a href="Placeography.html">Placeography</a>
                    </li>
                    
                </ul>
            </nav>
            <div><h1>Placeography</h1></div>
            <xsl:apply-templates/>
        </body></html>
    </xsl:template>
    <xsl:template match="//tei:ref">
        <a><xsl:attribute name="href">
            <xsl:value-of select="@target"/>            
        </xsl:attribute><xsl:value-of select="."/></a>
    </xsl:template>
    <xsl:template match="//tei:p">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:listPlace">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="//tei:place">
       <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:place/tei:placeName">
        <h2>
            <xsl:attribute name="id">
                <xsl:value-of select="../@xml:id"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </h2>
       </xsl:template>
    <xsl:template match="//tei:place/tei:figure">
        <img>
           <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="tei:figDesc"/></xsl:attribute>
        </img>
    </xsl:template>
    <xsl:template match="//tei:place/tei:location/tei:geo">
        <p>Location: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="//tei:place/tei:note">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Turns the resources type note into a list -->
    <xsl:template match="//tei:place/tei:note[@type = 'resources']/tei:list">
        <h3>Related Resources</h3>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <!-- Turns items in the resources type note to list items in html -->
    <xsl:template match="//tei:place/tei:note/tei:list/tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <!-- Turns ref elements to a elements in html with the target attribute as their href value -->
    <xsl:template match="//tei:place/tei:note[@type = 'resources']/tei:list/tei:item/tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <!-- Turns the mentions note into a list -->
    <xsl:template match="tei:place/tei:note[@type = 'mentions']/tei:list">
        <h3>Mentions</h3>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <!-- Makes items in the mentions type list li items in html -->
    <xsl:template match="tei:place/tei:note[@type = 'mentions']/tei:list/tei:item">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
 </xsl:stylesheet>