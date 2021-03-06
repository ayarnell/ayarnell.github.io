<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <listPerson>
            <xsl:for-each select="//tei:persName">
                <person>
                    <xsl:attribute name="xml:id"/>
                    <persName>
                        <xsl:value-of select="."/>
                    </persName>
                    <note>Chapter: <xsl:value-of select="ancestor::tei:div3/@n"/></note>
                </person>
            </xsl:for-each>
        </listPerson>
    </xsl:template>
<xsl:template match="div3">
    <note>
        <xsl:value-of select="@n"/>
    </note>
</xsl:template>
</xsl:stylesheet>
