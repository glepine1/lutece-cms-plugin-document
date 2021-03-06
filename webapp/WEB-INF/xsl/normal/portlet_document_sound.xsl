<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />
	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<xsl:template match="portlet">
	
	<xsl:variable name="device_class">
	<xsl:choose>
		<xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
		<xsl:when test="string(display-on-normal-device)='0'">hidden-tablet</xsl:when>
		<xsl:when test="string(display-on-large-device)='0'">hidden-desktop</xsl:when>
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	</xsl:variable>

	<div class="portlet {$device_class}">
			<xsl:if test="not(string(display-portlet-title)='1')">
				<h3><xsl:value-of disable-output-escaping="yes" select="portlet-name" /></h3>
			</xsl:if>
			<xsl:apply-templates select="document-portlet/document" />
			<xsl:if test="string(document-portlet/document)=''">
				<xsl:text disable-output-escaping="yes">
					&amp;nbsp;
				</xsl:text>
			</xsl:if>

		</div>
	</xsl:template>

	<xsl:template match="document">
		<div class="portlet-background-content -lutece-border-radius-bottom">
			<xsl:output method="html" indent="yes" />
			<xsl:if test="not(string(document-xml-content)='null')">
				<xsl:apply-templates
					select="document-xml-content/sound" />
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="sound">
		<p><strong><xsl:value-of select="document-title" /></strong></p>
		<p><xsl:value-of disable-output-escaping="yes" select="document-summary" /></p>
		<p>
		<xsl:choose>
			<xsl:when test="sound-file/file-resource!=''">
				<a href="servlet/plugins/document/resource?id={sound-file/file-resource/resource-document-id}&amp;id_attribute={sound-file/file-resource/resource-attribute-id}">
					<img src="images/local/skin/plugins/document/filetypes/audio.png" />
				</a>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		</p>
		<p>	<xsl:value-of disable-output-escaping="yes" select="sound-author" /></p>
	</xsl:template>
</xsl:stylesheet>

