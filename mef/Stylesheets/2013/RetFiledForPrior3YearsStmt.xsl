<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/RetFiledForPrior3YearsStmt"/>
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="RFPYTbl" class="styDepTbl" style="font-size:7pt;">
      <thead class="styDepTableThead">      
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">Year</th>
           <th class="styDepTblCell" scope="col">Corporation Name Filing Consolidated Return</th>
           <th class="styDepTblCell" scope="col">Taxable Income or Loss</th>
            <th class="styDepTblCell" scope="col">US Income Tax Paid</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/RetFiledForPriorYear">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Yr"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ConsolidatedRetCorporationName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="ConsolidatedRetCorporationName/BusinessNameLine2 !=''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ConsolidatedRetCorporationName/BusinessNameLine2"/>
                </xsl:call-template>
            </xsl:if>
            </td>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableIncomeOrNetLossAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="USIncomeTaxPaidAmt"/>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">

    <html>
      <head>
           <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>

        
        <style type="text/css">
        </style>
          <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"/>    
  </xsl:if>
</style>
    <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:102mm;"><xsl:value-of select="$depDocTitle"/></span>          
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate"/>
        
        <br/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>