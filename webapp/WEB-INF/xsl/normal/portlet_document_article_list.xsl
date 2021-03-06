<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />
	<xsl:param name="target" select="target" />
	<xsl:param name="page-id" select="page-id" />
	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<xsl:template match="portlet">
		<xsl:variable name="device_class">
		<xsl:choose>
			<xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
		<xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
		<xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
		<xsl:when test="string(display-on-xlarge-device)='0'">hidden-lg</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
	
		<div class="portlet {$device_class}">
			<xsl:if test="not(string(display-portlet-title)='1')">
				<h3 id="article_{$portlet-id}"><xsl:value-of disable-output-escaping="yes" select="portlet-name" /></h3>
			</xsl:if>
			<xsl:apply-templates select="document-list-portlet/document" />
			<xsl:text disable-output-escaping="yes">
				<![CDATA[<div class="clearfix">&#160;</div>]]>
			</xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="document">
		<xsl:if test="not(string(document-xml-content)='null')">
			<div class="col-md-6">
				<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id} {$target}">
					<xsl:for-each select="descendant::*">
						<xsl:value-of select="document-title" />
					</xsl:for-each>
				</a>
				<xsl:if test="(string(resource-is-votable)='1')">
					<br />
	        		<xsl:variable name="resource-score" select="resource-score" />
	        		<img src="images/local/skin/plugins/rating/stars_{$resource-score}.png" alt="Score" title="Score" />
		        </xsl:if>   
				<xsl:if test="(string(is-download-stat)='1')">
					<br />
					#i18n{rating.resource_vote.labelDownloadCount} : <xsl:value-of select="resource-download-stat" />
				</xsl:if>
				<br />
				<xsl:for-each select="descendant::*">
					<xsl:value-of select="document-summary" />
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
