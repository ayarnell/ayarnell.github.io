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
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <link rel="stylesheet" type="text/css" href="tacitus_test.css"/>
               </head>
            <body>
                <h1>The <i>Histories</i> of Tacitus</h1>
                <h2><xsl:value-of select="//tei:div1/tei:head"/></h2>
                <xsl:apply-templates/>
              </body>
        </html>
    </xsl:template>
   <!-- hides TEI header -->
    <xsl:template match="tei:TEI/tei:teiHeader"/>
    <!-- creates h2 headings from the xml:id of listWit and listBibl -->
    <xsl:template match="tei:front"/>
    <xsl:template match="//tei:div2/tei:listWit | //tei:div2/tei:listBibl">
        <!-- removes the hyphen from between editiones-antiquae and modern-editions -->
        <xsl:choose>
            <xsl:when test="@xml:id = 'codices'">
                <h2>
                    <xsl:value-of select="@xml:id"/>
                </h2>
            </xsl:when>
            <xsl:otherwise>
                <h2>
                    <xsl:value-of select="substring-before(@xml:id, '-')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="substring-after(@xml:id, '-')"/>
                </h2>
            </xsl:otherwise>
        </xsl:choose>
        <ul>
            <xsl:apply-templates select="tei:witness | tei:bibl" mode="sigla"/>
        </ul>
    </xsl:template>
    <!-- creates a list of the witnesses and puts the abbreviations in italics -->
    <xsl:template match="tei:witness">
        <li>
            <i>
                <xsl:value-of select="tei:abbr"/>
            </i>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="tei:name"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="tei:date"/>
        </li>
    </xsl:template>
    <!-- Does the same as above for the list of modern editions -->
    <xsl:template match="tei:bibl">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    <xsl:template match="//tei:div1/tei:head"/>
    <!-- breaks up the text by part, puts navigation to each section in a navbar at the top -->
    <xsl:template match="//tei:div2">
                         
        <xsl:apply-templates/>
          </xsl:template>
    <!-- pulls number of chapter from the n attribute. Adds navigation to top of page and the sigla -->
    <xsl:template match="//tei:div3">        
        <h2> Chapter <xsl:value-of select="@n"/></h2>
        <xsl:apply-templates/>        
       <nav> <ul class="miniNav">
       <li><a href="#home">Top</a></li>
       <li><a href="Sigla.html">Sigla</a></li>
        </ul></nav>
    </xsl:template>
    <!-- puts the p elements in the tei doc into p html elements -->
    <xsl:template match="//tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Shows all M readings -->
    <xsl:template match="//tei:app">
      <xsl:choose>
          <xsl:when test="tei:rdg[@wit!='#M']">
          <span class="crit"><xsl:value-of select="tei:lem"/></span>
          </xsl:when>
          <xsl:otherwise>
              <span class="M"><xsl:value-of select="tei:rdg[@wit='#M']"/></span>
          </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
    <!-- creates text for the toolip. Takes the value of the tooltip from the wit attribute, strips out the #, puts it in italics. Separates readings with a ; -->
        <xsl:template match="//tei:rdg">
        <xsl:if test="not(following-sibling::tei:rdg)">
            <i><xsl:value-of select="substring-after(@wit, '#')"/></i>: <xsl:value-of select="."/>
        </xsl:if>
        <xsl:if test="following-sibling::tei:rdg">
            <i><xsl:value-of select="substring-after(@wit, '#')"/></i>: <xsl:value-of select="."/>;
        </xsl:if>
    </xsl:template>
    <!-- adds the witDetail element separated by a : -->
    <xsl:template match="//tei:witDetail"> : <i><xsl:value-of select="."/></i>
    </xsl:template>
   </xsl:stylesheet>
