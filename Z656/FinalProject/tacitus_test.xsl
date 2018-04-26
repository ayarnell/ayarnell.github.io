<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
           <head>
                <title>Tacitus Histories</title>
                <link rel="stylesheet" type="text/css" href="tacitus_test.css"/>
            </head>
            <body>
                <h1>The <i>Histories</i> of Tacitus</h1>
                <h2><xsl:value-of select="//tei:div1/tei:head"/></h2>
                <xsl:apply-templates/>
            </body>
        </html>
      </xsl:template>
    <xsl:template match="tei:TEI/tei:teiHeader"/>
    <xsl:template match="tei:TEI/tei:text/tei:front">
        <h2>Sigla</h2>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:div1/tei:listWit | //tei:div1/tei:listBibl">
        <xsl:choose>
            <xsl:when test="@xml:id='codices'">
                <h3><xsl:value-of select="@xml:id"/></h3>
            </xsl:when>
          <xsl:otherwise>
              <h3>
            <xsl:value-of select="substring-before(@xml:id, '-')"/><xsl:text> </xsl:text> <xsl:value-of select="substring-after(@xml:id,'-')"/>
              </h3>
          </xsl:otherwise>  
        </xsl:choose>        
        <ul>
            <xsl:apply-templates select="tei:witness | tei:bibl"/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:witness">
        <li>
            <i><xsl:value-of select="tei:abbr"/></i><xsl:text>: </xsl:text><xsl:value-of select="tei:name"/><xsl:text>, </xsl:text><xsl:value-of select="tei:date"/>
        </li>
    </xsl:template>
    <xsl:template match="tei:bibl">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    <xsl:template match="//tei:div1/tei:head"/>
    <xsl:template match="//tei:div2">
        <h2>
            Part <xsl:value-of select="@n"/>
        </h2>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:div3">
        <xsl:variable name="chap_num">
            <xsl:number format="001"/>
        </xsl:variable>
        <xsl:result-document href="{concat('/Users/amyya/OneDrive/Desktop/Digital Publishing assignments/FinalProject/',$chap_num, '.html')}">
            <html>
                <head>
                    <title>Tacitus Histories</title>
                    <link rel="stylesheet" type="text/css" href="tacitus_test.css"/>
                </head>
                <body>
        <h3>
            Chapter <xsl:value-of select="@n"/>
        </h3>
        <xsl:apply-templates/>
          </body>   
            </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="//tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="//tei:app">
        <xsl:variable name="order" select="position()"/>
        <span class="tooltip">
            <xsl:value-of select="tei:lem"/>            
            <span class="tooltiptext" id="{concat('rdg-', $order)}">
                <xsl:apply-templates select="tei:rdg"/>
            </span>
        </span> 
    </xsl:template>
   <xsl:template match="//tei:rdg">
    <xsl:if test="not(following-sibling::tei:rdg)">
     <i><xsl:value-of select="substring-after(@wit,'#')"/></i>: <xsl:value-of select="."/>
    </xsl:if>   
    <xsl:if test="following-sibling::tei:rdg">
   <i><xsl:value-of select="substring-after(@wit,'#')"/></i>: <xsl:value-of select="."/>;
    </xsl:if>
   </xsl:template>
    <xsl:template match="tei:hi[@rend = 'bold']">
        <b>
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'i']">
        <i>
            <xsl:value-of select="."/>
        </i>
    </xsl:template>
    <xsl:template match="//tei:hi[@rend = 'sup']">
        <sup>
            <xsl:value-of select="."/>
        </sup>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'u']">
        <h2 class="large_title">
            <xsl:value-of select="."/>
        </h2>
    </xsl:template>
</xsl:stylesheet>
