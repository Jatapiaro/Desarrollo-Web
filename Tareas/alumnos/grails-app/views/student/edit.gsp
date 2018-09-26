<%@ page import="com.itesm.grails.alumnos.Career"%>
<%@ page import="com.itesm.grails.alumnos.Campus"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Alumno')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-student" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.student}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.student}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.student}" method="PUT">
                <g:hiddenField name="version" value="${this.student?.version}" />
                <fieldset class="form">

                    <div class="fieldcontain required">
                        <span id="matricula-label" class="property-label">Matricula:</span>
                        <div class="property-value" aria-labelledby="matricula-label">${student.matricula}</div>
                    </div>
                    
                    <div class="fieldcontain required">
                        <label>Nombre Completo: </label>
                        <g:textField name="nombreCompleto" id="nombre" value="${student.nombreCompleto}" size="50"/>
                    </div>

                    <div class="fieldcontain required">
                        <label>Dirección: </label>
                        <g:textArea name="direccion" id="direccion" value="${student.direccion}"/>
                    </div>
                    <div class="fieldcontain required">
                        <label>Correo electrónico: </label>
                        <g:textField name="correoElectronico" id="correoElectronico" value="${student.correoElectronico}" size="30"/>
                    </div>
                    <div class="fieldcontain required">    
                        <label>Carrera: </label> <g:select name="career" from ="${Career.list()}" optionKey="id" optionValue="nombreCarrera"/>
                    </div>
                    <div class="fieldcontain required">
                        <label>Campus: </label> <g:select name="campus" from ="${Campus.list()}" optionKey="id" optionValue="nombreCampus"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
