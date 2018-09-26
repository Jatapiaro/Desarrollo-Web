<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'career.label', default: 'Carrera')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-career" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-career" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.career}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.career}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.career}" method="PUT">
                <g:hiddenField name="version" value="${this.career?.version}" />
                <div class="fieldcontain required">
                    <label>Siglas: <label>
                    <g:textField name="siglas" id="siglas" value="${career.siglas}" min="3" max="3" maxlength="3"/>
                </div>

                <div class="fieldcontain required">
                    <label>Nombre de la carrera: <label>
                    <g:textField name="nombreCarrera" id="nombreCarrera" value="${career.nombreCarrera}" />
                </div>

                <div class="fieldcontain required">
                    <label>Programa: <label>
                    <g:textField type="number"   name="programa" id="programa" value="${career.programa}" min="1980" max="3000" maxlength="4"/>
                </div>
                
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
