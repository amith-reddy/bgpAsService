<%@ page import="bgpasservice.Neighbor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'neighbor.label', default: 'Neighbor')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'tooltipStyles.css')}"/>
	</head>
	<body>
		<a href="#edit-neighbor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id='cssmenu'>
		<ul>
		<li class="controller"><a href="${createLink(uri: '/')}" >Home</a></li>
		<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
			<!--  <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li> -->
			<g:if test = "${c.logicalPropertyName != 'assets' && c.logicalPropertyName != 'dbdoc' && c.logicalPropertyName != 'sendMail' && c.logicalPropertyName != 'login'&& c.logicalPropertyName != 'logout'}">
				<li class="${controllerName == c.logicalPropertyName ? 'active' : ''}"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName[0].toUpperCase().concat(c.logicalPropertyName.substring(1))}</g:link></li>
			</g:if>
		</g:each>
		</ul>
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-neighbor" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${neighborInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${neighborInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:neighborInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${neighborInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
