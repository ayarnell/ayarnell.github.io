<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    <!-- I could not get this variable to work. What am I missing? -->
    <xsl:variable name="full_name">
        <xsl:value-of select="position"/>: <xsl:value-of select="first"/><xsl:text> </xsl:text> <xsl:value-of select="last"/>
     </xsl:variable>    
      <xsl:template match="/">
        <html>
            <head>
                <title>Baseball Stats</title>
                <link rel="stylesheet" type="text/css" href="https://ayarnell.github.io/css/main.css"/>
            </head>
            <body>
                <h1><xsl:value-of select="string(game/team[1]/@name)"/> at <xsl:value-of
                        select="game/@venue"/>, <xsl:value-of select="game/@date"/></h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="game/team">
        <h2><xsl:value-of select="@type"/> team: the <xsl:value-of select="@name"/></h2>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Player (Jersey #)</th>
                        <th>rl</th>
                        <th>bats</th>
                        <th>position</th>
                        <th>bat order</th>
                        <th>avg</th>
                        <th>hr</th>
                        <th>rbi</th>
                    </tr>
                </thead>
                <xsl:apply-templates select="player">
                   <xsl:sort select="bat_order"/>
                    <xsl:sort select="last"/>
                </xsl:apply-templates>
            </table>
        </div>
        <h3>Coaches</h3>
        <div>
            <xsl:apply-templates select="coach"/>
        </div>
    </xsl:template>
    <xsl:template match="game/team/player">
        <tr>
            <td><xsl:value-of select="last"/>, <xsl:value-of select="first"/> (<xsl:value-of select="num"/>)</td>
            <td>
                <xsl:value-of select="rl"/>
            </td>
            <td>
                <xsl:value-of select="bats"/>
            </td>
            <td>
                <xsl:value-of select="position"/>
            </td> 
            <td>
            <!-- I imagine there is an easier way to do this. I could not figure out how to get the N/As to sort after the numbered batting orders -->
                <xsl:choose>
                    <xsl:when test="contains(bat_order,'0')"></xsl:when>
                    <xsl:when test="contains(bat_order,'1')"></xsl:when>
                    <xsl:when test="contains(bat_order,'2')"></xsl:when>
                    <xsl:when test="contains(bat_order,'3')"></xsl:when>
                    <xsl:when test="contains(bat_order,'4')"></xsl:when>
                    <xsl:when test="contains(bat_order,'5')"></xsl:when>
                    <xsl:when test="contains(bat_order,'6')"></xsl:when>
                    <xsl:when test="contains(bat_order,'7')"></xsl:when>
                    <xsl:when test="contains(bat_order,'8')"></xsl:when>
                    <xsl:when test="contains(bat_order,'9')"></xsl:when>
                    <xsl:otherwise><xsl:text>N/A</xsl:text></xsl:otherwise>
                </xsl:choose><xsl:value-of select="bat_order"/>                
            </td>
           <td>
                <xsl:value-of select="avg"/>
            </td>
            <td>
                <xsl:value-of select="hr"/>
            </td>
            <td>
                <xsl:value-of select="rbi"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="game/team/coach">
        <ul>
            <li><xsl:value-of select="$full_name"/></li>
        </ul>
           </xsl:template>
   <xsl:template match="game/umpires">
        <h3>Umpires</h3>
       <xsl:apply-templates/>
     </xsl:template>

    <xsl:template match="game/umpires/umpire">
        <div>
            <ul>
                <li><xsl:value-of select="$full_name"/></li>
            </ul>
         </div>
      </xsl:template>
</xsl:stylesheet>
