<%@ page import="com.itesm.mx.Equipo"%>
<%@ page import="com.itesm.mx.Jornada"%>
<%@ page import="com.itesm.mx.Partido"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-partido" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.partido}" method="PUT">
                <g:hiddenField name="version" value="${this.partido?.version}" />
                <fieldset class="form">

                    <div class="fieldcontain required">    
                        <label>Jornada: ${partido.jornada}</label>
                    </div>
                    <div class="fieldcontain required">    
                        <label>Equipo local: ${partido.local}</label> 
                    </div>
                    
                    <g:if test="${partido.estado == 'Por jugar'}">
                        <div class="fieldcontain required">
                             <label>Marcador Local: </label>
                             <g:field type="number" name="marcadorLocal" id="marcadorLocal" value="${partido.marcadorLocal}" min="0"/>
                         </div>

                         <div class="fieldcontain required">
                             <label>Marcador visitante: </label>
                             <g:field type="number" name="marcadorVisitante" id="marcadorVisitante" value="${partido.marcadorVisitante}" min="0"/>
                        </div>
                    </g:if>
                    <g:elseif test="${partido.estado == 'Jugando'}">
                        <div class="fieldcontain required">
                             <label>Marcador Local: </label>
                             <g:field type="number" min="${partido.marcadorLocal}" max="${partido.marcadorLocal+1}" name="marcadorLocal" id="marcadorLocal" value="${partido.marcadorLocal}"/>
                         </div>

                         <div class="fieldcontain required">
                             <label>Marcador visitante: </label>
                             <g:field type="number" min="${partido.marcadorVisitante}" max="${partido.marcadorVisitante+1}" name="marcadorVisitante" id="marcadorVisitante" value="${partido.marcadorVisitante}"/>
                        </div>
                    </g:elseif>
                    <g:elseif test="${partido.estado == 'Finalizado'}">
                        <div class="fieldcontain">   
                            <label>Marcador Local: ${partido.marcadorLocal}</label>
                            
                        </div>
                        <div class="fieldcontain">   
                            <label>Marcador Visitante: ${partido.marcadorVisitante}</label>
                            
                        </div>
                    </g:elseif>
                    


                    <div class="fieldcontain">    
                        <label>Equipo visitante: ${partido.visitante}</label> 
                    </div>
                    
                    <g:if test="${partido.estado == 'Por jugar'}">
                        <div class="fieldcontain required">    
                            <label>Estado del partido:</label>
                            <g:select name="estado" from="${['Jugando','Finalizado']}"/> 
                        </div>
                    </g:if>
                    <g:elseif test="${partido.estado == 'Jugando'}">
                        <div class="fieldcontain required">    
                            <label>Estado del partido:</label>
                            <g:select name="estado" from="${['Jugando','Finalizado']}"/>  
                        </div>
                    </g:elseif>
                    <g:elseif test="${partido.estado == 'Finalizado'}">
                        <div class="fieldcontain required">    
                            <label>Estado del partido: Partido finalizado</label> 
                        </div>
                    </g:elseif>


                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
