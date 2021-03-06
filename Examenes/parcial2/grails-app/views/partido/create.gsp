<%@ page import="com.itesm.mx.Equipo"%>
<%@ page import="com.itesm.mx.Jornada"%>
<%@ page import="com.itesm.mx.Partido"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-partido" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.partido}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.partido}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <!--<f:all bean="partido"/>-->
                    <div class="fieldcontain required">    
                        <label>Equipo local: </label> <g:select name="partido.local" from="${Equipo.list()}" optionKey="id" optionValue="nombre"/>
                    </div>

                    <div class="fieldcontain required">    
                        <label>Equipo visitante: </label> <g:select name="partido.visitante" from="${Equipo.list()}" optionKey="id" optionValue="nombre"/>
                    </div>

                    <div class="fieldcontain required">    
                        <label>Jornada: </label> <g:select name="partido.jornada" from="${Jornada.list()}" optionKey="id" optionValue="label"/>
                    </div>



                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
