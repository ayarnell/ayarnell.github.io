<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
   <!-- hides TEI header -->
    <xsl:template match="tei:TEI/tei:teiHeader"/>
    <!--Creates a separate html page for the sigla section  -->
    <xsl:template match="tei:TEI/tei:text/tei:front">    
        <xsl:variable name="part_num" select="position() - 1"/>
        <xsl:result-document href="{concat('/Users/amyya/OneDrive/Desktop/Digital Publishing assignments/FinalProject/', 'Sigla', '.html')}"> <html>
           <head>
               <title>Tacitus Histories</title>
               <link rel="stylesheet" type="text/css" href="tacitus_test.css"/>
           </head>
           <body>
               <nav>
                   <ul>
                       <li><a href="index.html">About</a></li>
                       <li><a href="Sigla.html">Sigla</a></li>
                       <li><a href="textnav.html">Text</a>
                           <ul>
                               <li><a href="Part01.html">Part 1 (Ch. 1-9)</a></li>
                               <li><a href="Part02.html">Part 2 (Ch. 10-19)</a></li>
                               <li><a href="Part03.html">Part 3 (Ch. 20-29)</a></li>
                               <li><a href="Part04.html">Part 4 (Ch. 30-39)</a></li>
                               <li><a href="Part05.html">Part 5 (Ch. 40-49)</a></li>
                               <li><a href="Part06.html">Part 6 (Ch. 50-59)</a></li>
                               <li><a href="Part07.html">Part 7 (Ch. 60-69)</a></li>
                               <li><a href="Part08.html">Part 8 (Ch. 70-79)</a></li>
                               <li><a href="Part09.html">Part 9 (Ch. 80-90)</a></li>                                                           
                           </ul>                           
                       </li>                          
                   </ul>
               </nav>
               <div id="home"> 
                   <h1>Sigla</h1>    
                   <h2>Introduction</h2>
                   <p>The following is based on the <i>Oxford Classical Text</i> edition of the <i>Histories</i> of Tacitus by C.D. Fisher. The lists below represent the manuscripts that Fisher consulted in constructing his critical edition. The medieval manuscripts (codices) and early critical texts (editiones antiquae) are represented in the apparatus by an abbreviation. This abbreviation appears before the variant reading throughout the apparatus. In the text on this site, users may hover over underlined words to view the variant readingsM represents the earliest surviving manuscript and the exemplar for the later ones.</p>
                   <xsl:apply-templates mode="sigla"/>                    
               </div>
           <!-- adds navigation to next page, if not the last page -->
               <xsl:if test="not(position()=10)">
                   <a href="{concat('Part0',$part_num+1,'.html')}">Next</a>
               </xsl:if>   
           </body>
           </html>                
       </xsl:result-document>    
      </xsl:template>
    <!-- creates h2 headings from the xml:id of listWit and listBibl -->
    <xsl:template match="//tei:div2/tei:listWit | //tei:div2/tei:listBibl" mode="sigla">
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
    <xsl:template match="tei:witness" mode="sigla">
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
    <xsl:template match="tei:bibl" mode="sigla">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    <xsl:template match="//tei:div1/tei:head"/>
    <!-- breaks up the text by part, puts navigation to each section in a navbar at the top -->
    <xsl:template match="//tei:div2">
        <xsl:variable name="part_num" select="position() - 1"/>
        <xsl:result-document
            href="{concat('/Users/amyya/OneDrive/Desktop/Digital Publishing assignments/FinalProject/','Part0',$part_num, '.html')}">
            <html>
                <head>
                    <title>Tacitus Histories</title>
                    <link rel="stylesheet" type="text/css" href="tacitus_test.css"/>
                </head>
                <body>
                  <nav>
                      <ul>
                          <li><a href="index.html">About</a></li>
                          <li><a href="Sigla.html">Sigla</a></li>
                          <li><a href="textnav.html">Text</a>
                          <ul>
                              <li><a href="Part01.html">Part 1 (Ch. 1-9)</a></li>
                              <li><a href="Part02.html">Part 2 (Ch. 10-19)</a></li>
                              <li><a href="Part03.html">Part 3 (Ch. 20-29)</a></li>
                              <li><a href="Part04.html">Part 4 (Ch. 30-39)</a></li>
                              <li><a href="Part05.html">Part 5 (Ch. 40-49)</a></li>
                              <li><a href="Part06.html">Part 6 (Ch. 50-59)</a></li>
                              <li><a href="Part07.html">Part 7 (Ch. 60-69)</a></li>
                              <li><a href="Part08.html">Part 8 (Ch. 70-79)</a></li>
                              <li><a href="Part09.html">Part 9 (Ch. 80-90)</a></li>                                                           
                          </ul>
                          
                          </li>                          
                      </ul>
                  </nav>
                <!-- pulls the number of each part from the n attribute -->   
                    <div id="home"> 
                       <h1>PART <xsl:value-of select="@n"/></h1>                                    
                    <xsl:apply-templates/>                    
                   </div>
                  <xsl:if test="not(position()=10)">
                    <a href="{concat('Part0',$part_num+1,'.html')}">Next</a>
                  </xsl:if>   
                </body>
                </html>                        
        </xsl:result-document>
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
    <!-- creates the tooltip from the app element. -->
    <xsl:template match="//tei:app">
        <xsl:variable name="order" select="position()"/>
    <!-- puts a span around lem element -->
        <span class="tooltip">
            <xsl:value-of select="tei:lem"/>
     <!-- nests a span element for the rdg and witDetail element -->
            <span class="tooltiptext" id="{concat('rdg-', $order)}">
                <xsl:apply-templates select="tei:rdg | tei:witDetail"/>
            </span>
        </span>
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
