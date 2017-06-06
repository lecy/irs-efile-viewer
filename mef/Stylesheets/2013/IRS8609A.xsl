<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8609AStyle.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8609SAData" select="$RtnDoc/IRS8609A"/>
  <xsl:template match="/">
  <!-- 6/15/2011 RLW -->
  <!-- 8/25/2011 RLW -->
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8609SAData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching  -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Schedule A (Form 8609)"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <!-- Form8609A header start -->
        <style type="text/css">
          <!-- PRINT STATEMENT -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8609AStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form style="font-family:arial; font-size:9pt" name="Form8609A">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="height:18mm; width:187mm">
            <div class="styFNBox" style="width:31mm; height:18mm; font-size:7pt">
              <div>
                <span class="styFormNumber" style="font-size:10">Form</span>
                <span class="styFormNumber" style="font-size:20pt">8609-A</span>
                <!--General Dependency Push Pin -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData"/>
                </xsl:call-template>
                <br/>(Rev. December 2008)
            <div style="font-size:6pt; margin-top:1mm">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
              </div>
            </div>
            <div class="styFTBox" style="width:124mm; height:18mm">
              <div class="styMainTitle" style="height:8mm; padding-top:2mm">
                Annual Statement for Low-Income Housing Credit
               </div>
              <div class="styFBT" style="font-size:8pt; text-align:center">
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                File with owner's federal income tax return.
                 <br/>
                <span style="height:2mm;">
                  <img src="{$ImagePath}/8609A_Bullet_Md.gif" alt="MidSizeBullet"/> See separate instructions.</span>
              </div>
            </div>
            <div class="styTYBox" style="font-size:7pt; height:18mm">
              <div class="styOMB" style="float:left; width:31mm; padding-top:3mm; height:9mm">OMB No. 1545-0988</div>
              <div style="float:left; padding-left:5mm; height:5mm; padding-top:1mm; text-align:left">Attachment<br/>
                            Sequence No. <b style="font-size:9pt">36</b>
              </div>
            </div>
          </div>
          <!-- end headers line -->
          <!--======================================BEGIN RETURN HEADER=================================-->
          <!-- Begin Names and Identifying number section -->
          <div style="width:187mm;" class="styBB">
            <div style="width:110mm;height:8mm;font-weight:normal;font-size:6pt;font-weight:normal;" class="styNameBox">
             Name(s) shown on return <br/>
		    <!--Choice statement for EIN Line when either filing with 1120 or 1040 and data calling from a ReturnHeader-->
           <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
            <xsl:choose>
           <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">								  
            <br/>
           <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">Name</xsl:with-param>
          </xsl:call-template>
           </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
        </xsl:otherwise>
 </xsl:choose>
</div>
   <div style="width:49mm;height:4mm;padding-left:2mm;font-size:8pt;" class="styEINBox">
  Identifying number
      <br/>   
  <!--Choice statement for EIN Line when either filing with 1120 or 1040 and data calling from a ReturnHeader-->
  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
  <span style="font-weight:normal;">
  <xsl:choose>
    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose> 
  </span>
   </div>
  </div>
          <!-- End Names and Identifying number section -->
          <!-- Start Part I Compliance Informations -->
          <div style="width:187mm;" class="styBB">
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Compliance Information  
            </div>
          </div>
          <!-- build yes/no headers -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:154.75mm;"/>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;">Yes</div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;">No</div>
            </div>
          </div>
          <!-- end build yes/no headers -->
          <!-- Begin line A -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">A</div>
              <div class="styLNDesc" style="height:4mm;width:159.75mm;">
                                   Building identification number (BIN) 
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                <span style="width:2mm"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/BIN"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                         border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line A -->
          <!-- Begin line B -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">B</div>
              <div class="styLNDesc" style="height:4mm;width:125mm;">
                        This Form 8609-A is for (check the box) 
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                        a newly constructed or existing building
                 
                 <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8609SAData/NewlyConstrOrExstngBuildingInd"/>
                    <xsl:with-param name="BackupName">IRS8609ANewlyConstructed</xsl:with-param>
                  </xsl:call-template>
                </input>
                <!-- Label Correction -->
                <span style="width: 2mm"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8609SAData/NewlyConstrOrExstngBuildingInd"/>
                    <xsl:with-param name="BackupName">IRS8609ANewlyConstructed</xsl:with-param>
                  </xsl:call-template>
                </label>
                <!-- Label Correction -->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line B -->
          <!-- Begin line B1 -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:120mm;">
                        section 42(e) rehabilitation expenditures 
                
                 <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8609SAData/Section42eRehbltExpendInd"/>
                    <xsl:with-param name="BackupName">IRSIRS8609ASection42e</xsl:with-param>
                  </xsl:call-template>
                </input>
                <!-- Label Correction -->
                <span style="width: 2mm"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8609SAData/Section42eRehbltExpendInd"/>
                    <xsl:with-param name="BackupName">IRSIRS8609ASection42e</xsl:with-param>
                  </xsl:call-template>
                </label>
                <!-- Label Correction -->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line B1 -->
          <!-- Begin line C -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">C</div>
              <div class="styLNDesc" style="height:4mm;width:160mm;">
                        Do you have in your records the original Form 8609 (or a copy thereof) 
                        signed and issued by the housing credit
                </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:1px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                <span style="float:left;">agency for the building in<span style="font-weight:bold"> A</span> ?</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
                       
           
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/Orig8609HousingCrAgencyRecInd"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/Orig8609HousingCrAgencyRecInd"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                        If "No," see the instructions and stop here ...... do not go to Part II.  
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line C -->
          <!-- Begin line D -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">D</div>
              <div class="styLNDesc" style="height:4mm;width:160mm;">
                        Did the building in <span style="font-weight:bold"> A </span>qualify as a part of a qualified low-income 
                        housing project and meet the requirements of 
                 </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:1px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                <span style="float:left;">section 42 as of the end of the tax year for which this form is being filed? </span>
                <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/QlfyLowIncmHsngProjSect42Ind"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/QlfyLowIncmHsngProjSect42Ind"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                        If "No," see the instructions and stop here ...... do not go to Part II.  
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                         border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line D -->
          <!-- Begin line E -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">E</div>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                       Was there a decrease in the qualified  basis of the building in 
                       <span style="font-weight:bold"> A </span>for the tax year 
                       for which this form is being 
                 </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:1px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                <span style="float:left;">filed?</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">...................................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/DecreaseQualifiedBasisBldgInd"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/DecreaseQualifiedBasisBldgInd"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                        If "Yes," see the instructions.  If "No," and the entire 
                        credit has been claimed in prior tax years, stop here--do  
                </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                          border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                        border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                        not go to Part II.
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;                background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line E -->
          <!-- Start Part II Current Year Credit -->
          <div class="styBB" style="width:187mm;border-top-width: 1px;">
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Computation of Credit  
            </div>
          </div>
          <!-- End Part II Current Year Credit -->
          <!-- begin part II line 1 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">1</div>
            <div style="float:left">
          Eligible basis of building             
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .........................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">1</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/BuildingEligibleBasisAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 1 -->
          <!-- begin part II line 2 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">2</div>
            <div style="float:left">
         Low-income portion  (smaller of unit fraction or floor space fraction) (if first year of the credit   
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ...
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox" style="border-bottom:0 solid black"/>
              <div class="styIRS8609ScheduleALNAmountBox" style="border-bottom:0 solid black"/>
            </div>
          </div>
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum"/>
            <div style="float:left">
          period, see instructions)   
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .........................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">2</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/LowIncomePortionRt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 2 -->
          <!-- begin part II line 3 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">3</div>
            <div style="float:left">
         Qualified basis of low-income building. Multiply line 1 by line 2 (see instructions for exceptions)    
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">3</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/QualifiedBasisOfLowIncmBldgAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 3 -->
          <!-- begin part II line 4 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">4</div>
            <div style="float:left">
         Part-year adjustment for disposition or acquisition during the tax year   
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ...........
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">4</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/PartYearAdjustmentDuringTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 4 -->
          <!-- begin part II line 5 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">5</div>
            <div style="float:left">
         Credit percentage
         </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ...........................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">5</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/MaximumApplicableCrPct"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 5 -->
          <!-- begin part II line 6 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">6</div>
            <div style="float:left">
          Multiply  line 3 or line 4 by the percentage on line 5
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">6</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/CreditForLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 6 -->
          <!-- begin part II line 7 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">7</div>
            <div style="float:left">
            Additions to qualified basis, if any
         </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ......................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">7</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/QualifiedBasisAdditionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 7 -->
          <!-- begin part II line 8 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">8</div>
            <div style="float:left">
          Part-year adjustment for disposition or acquisition during the tax year
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..........
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">8</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/PartYearAdjustment2DuringTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 8 -->
          <!-- begin part II line 9 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">9</div>
            <div style="float:left">
          Credit percentage. Enter one-third of the percentage on line 5 
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .............
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">9</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/OneThirdMaximumApplicableCrPct"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 9 -->
          <!-- begin part II line 10 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">10</div>
            <div style="float:left">
          Multiply line 7 or line 8 by the percentage on line 9 
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">10</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/IntBasedLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 10 -->
          <!-- begin part II line 11  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">11</div>
            <div style="float:left">
          Section 42(f)(3)(B) modification
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            .......................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">11</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/Section42f3BModificationAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 11 -->
          <!-- begin part II line 12  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">12</div>
            <div style="float:left">
          Add lines 10 and 11
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ...........................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">12</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/AdjCrForLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 12 -->
          <!-- begin part II line 13  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">13</div>
            <div style="float:left">
          Credit for building before line 14 reduction. Subtract line 12 from line 6
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..........
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">13</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/CreditForBldgBfrReductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 13 -->
          <!-- begin part II line 14  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">14</div>
            <div style="float:left">
         Disallowed credit due to federal grants (see instructions)
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..............
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">14</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/DsallwCrDueToFederalGrantAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 14 -->
          <!-- begin part II   -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">15</div>
            <div style="float:left">
         Credit allowed for building for tax year. Subtract line 14 from line 13, but do not enter more than 
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox" style="border-bottom:0 solid black"/>
              <div class="styIRS8609ScheduleALNAmountBox" style="border-bottom:0 solid black"/>
            </div>
          </div>
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum"/>
            <div style="float:left">
         the amount shown on Form 8609, Part I, line 1b
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..................
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">15</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/CreditAllowedForBldgForTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 15 -->
          <!-- begin part II line 16  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">16</div>
            <div style="float:left">
       Taxpayer's proportionate share of credit for the year (see instructions)
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..........
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">16</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/TaxpayerShareOfCreditForYrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 16 -->
          <!-- begin part II line 17  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">17</div>
            <div style="float:left">
       Adjustments for deferred first-year credit (see instructions)
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..............
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">17</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/AdjForDeferredFirstYrCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 17 -->
          <!-- begin part II line 18  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">18</div>
            <div style="float:left">
        Taxpayer's credit. Combine lines 16 and 17. Enter here and on Form 8586 (see instructions).  
        </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
            ..
          </span>
              <div class="styIRS8609ScheduleALNRightNumBox">18</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609SAData/LowIncomeHousingCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 18 -->
          <div class="styFooter" style="width:187mm;clear:both;font-size:8pt;border-top:2 solid Black;">
            <div style="width:105mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
            <div style="width:25mm;text-align:left" class="styGenericDiv">Cat No. 38841T</div>
            <div style="width:57mm;padding-left:2mm;text-align:right" class="styGenericDiv">
              <span class="styBoldText">Form 8609-A (Rev 12-2008)</span>
            </div>
          </div>
          <p style="page-break-before:always"/>
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">
          Additional Data        
        </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8609SAData"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>