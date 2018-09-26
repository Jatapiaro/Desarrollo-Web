<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jornada.label', default: 'Jornada')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-jornada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-jornada" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.jornada}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.jornada}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.jornada}" method="PUT">
                <g:hiddenField name="version" value="${this.jornada?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                    <g:if test="${jornada.estado == 'Por jugar'}">
                        <label>Torneo: </label>
                        <g:textField name="torneo" id="torneo" size="50" value="${jornada.torneo}"/>
                    </g:if>
                    <g:else>
                        <label>Torneo: ${jornada.torneo}</label>
                    </g:else>
                    </div>
                        <g:if test="${jornada.estado == 'Por jugar'}">
                            <div class="fieldcontain required">    
                                <label>Estado de la jornada: </label>
                                <g:select name="estado" from="${['Por jugar','En curso']}"/> 
                            </div>
                        </g:if>
                        <g:elseif test="${jornada.estado == 'En curso'}">
                            <div class="fieldcontain">    
                                <label>Estado de la jornada: </label>
                                <g:select name="estado" from="${['En curso','Finalizada']}"/> 
                            </div>
                        </g:elseif>
                        <g:else>
                            <div class="fieldcontain required">    
                                <label>Estado de la jornada: ${jornada.estado}</label>
                            </div>
                        </g:else>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
