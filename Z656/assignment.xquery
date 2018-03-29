declare default element namespace "urn:isbn:1-931666-22-9";

<findingaids>
{for $ead in collection("file:///c:/Users/amyya/OneDrive/Desktop/xquery-assignment?select=*.xml")
order by $ead/ead/archdesc/did/physdesc/extent descending
return
<findingaid>
   <id>{data($ead//eadid)}</id>
   <title>{data($ead//filedesc//titleproper)}</title>
   <subtitle>{data($ead//subtitle)}</subtitle>
   <daterange>{number(substring-after($ead/ead/eadheader/filedesc/titlestmt/titleproper/date, "-")) - number(substring-before($ead/ead/eadheader/filedesc/titlestmt/titleproper/date, "-"))}</daterange>
   <encoder>{substring-after($ead/ead/eadheader/filedesc/titlestmt/author, "by ")}</encoder>
   <revisions>{count($ead/ead/eadheader/revisiondesc/change)}</revisions>
   <extent>{data($ead/ead/archdesc/did/physdesc/extent)}</extent>
   <restrictions>{string-join($ead/ead/archdesc/accessrestrict/p, " | ")}</restrictions>
   <indexingterms>
    {for $terms in $ead/ead/archdesc/controlaccess/controlaccess/list/item/extref/subject
    return 
   <indexterm>{data($terms)}</indexterm>
   }
   </indexingterms>
   <files>{count($ead/ead/archdesc/dsc/c01/c02/c03/@level)}</files>
</findingaid>}
</findingaids>