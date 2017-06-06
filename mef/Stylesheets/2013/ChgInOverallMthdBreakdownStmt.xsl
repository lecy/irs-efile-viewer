<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/ChgInOverallMthdBreakdownStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
    
  
  <xsl:template name="DependencyTemplate">    
    <xsl:param name="thisDesc"/>
    <xsl:param name="thisNode"/>
    <table class="styDepTbl" style="margin-top:4mm;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" colspan="2">
             <xsl:value-of select="$thisDesc"/>
           </th>              
        </tr>
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">Description</th>
           <th class="styDepTblCell" scope="col">Amount</th>         
        </tr>
      </thead>  
      <tfoot/>
      <tbody>    
      <xsl:for-each select="$thisNode">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>                
          <td class="styDepTblCell" align="left" style="font-size:8pt">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description"/>
            </xsl:call-template>    
          </td>
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Amount"/>
            </xsl:call-template>    
          </td>          
        </tr>
      </xsl:for-each>
      </tbody>    
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Financial Services Income Statement-->
          <xsl:value-of select="$depDocTitle"/>
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
         <meta name="Description" content="{$depDocTitle}"/>
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
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
          <div class="styDepTitle" style="width:80mm">
            <!--TY 2003 Change in Overall Method Breakdown Statement-->    
            <xsl:value-of select="$depDocTitle"/>         
          </div>
        </div>          
        
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>            
                
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/IncomeAccruedButNotReceived"/>    
          <xsl:with-param name="thisDesc">Income accrued but not received</xsl:with-param>
        </xsl:call-template>  
        
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/ExpensesAccruedButNotPaid"/>    
          <xsl:with-param name="thisDesc">Expenses accrued but not paid</xsl:with-param>
        </xsl:call-template>  
        
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/PrepaidExpnsPreviouslyDeducted"/>    
          <xsl:with-param name="thisDesc">Prepaid expenses previously deducted</xsl:with-param>
        </xsl:call-template>  
        
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/SuppliesOnHandPrevDeducted"/>    
          <xsl:with-param name="thisDesc">Supplies on hand previously deducted</xsl:with-param>
        </xsl:call-template>  
        
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/InventoryOnHandPrevDeducted"/>    
          <xsl:with-param name="thisDesc">Inventory on hand previously deducted</xsl:with-param>
        </xsl:call-template>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>