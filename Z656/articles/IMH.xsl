<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
       <xsl:template match="journal_issue/text/body/div">
           <xsl:variable name="art_num">
               <xsl:number format="001"/>
           </xsl:variable>
           <xsl:result-document href="{concat('/articles/',$art_num, '.html')}">
           <html>
            <head>
                <title>Indiana Magazine of History</title>
                <link rel="stylesheet" type="text/css" href="IMH_style.css"/>
            </head>
            <body>
                <div>
                    <h1><i>The</i> Indiana Magazine <i>of</i> History</h1>
                </div>
                <hr/>
                <div>
                    <span class="header">Vol. I</span>
                    <span class="header">First Quarter, 1905</span>
                    <span class="header">No. I</span>                   
                </div>
                <hr/>
                <div>                                       
                  <xsl:apply-templates/>
               </div> 
            </body>
        </html>
           </xsl:result-document>
    </xsl:template>
   <xsl:template match="head[1]|head[1]/hi[@rend='u']">        
       <h2><xsl:value-of select="."/></h2>
      </xsl:template>
    <xsl:template match="head[2]">
        <h3><xsl:value-of select="."/></h3>
    </xsl:template>
    <xsl:template match="p|byline">
        <p><xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="//div/p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
  <xsl:template match="list">
      <xsl:choose>
          <xsl:when test="@type='ordered'">
              <ol>
                  <xsl:apply-templates select="item"/>
              </ol>
          </xsl:when>
          <xsl:otherwise>
              <ul>
                  <xsl:apply-templates select="item"/>
              </ul>
          </xsl:otherwise>        
        </xsl:choose>
    </xsl:template>
    <xsl:template match="item">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    <xsl:template match="hi[@rend='b']">
        <b><xsl:value-of select="."/></b>
    </xsl:template>
    <xsl:template match="hi[@rend='i']">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    <xsl:template match="hi[@rend='sup']">
        <sup><xsl:value-of select="."/></sup>
    </xsl:template>
    <xsl:template match="hi[@rend='u']">
        <h2 class="large_title"><xsl:value-of select="."/></h2>
       </xsl:template>
    <xsl:template match="quote[@rend='blockquote']">
        <blockquote><xsl:value-of select="."/></blockquote>
    </xsl:template>
    <xsl:template match="note">
        <p class="marginal"><xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="teiHeader"/>
</xsl:stylesheet>
