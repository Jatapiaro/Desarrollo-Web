<%@ page import="com.itesm.grails.alumnos.Student"%>
<%@ page import="com.itesm.grails.alumnos.Career"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'career.label', default: 'Carrera')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-career" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-career" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:table collection="${careerList}" />-->
            <!-- Solo se quito por los formatos feos que ponía al año-->

            <div id="list-career" class="content scaffold-list" role="main">
                <h1>Lista de carreras</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Siglas</th>
                            <th>Nombre Carrera</th>
                            <th>Programa</th>
                            <th>Estudiantes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${Career.list()}" status="i" var="career">
                            <g:if test="${career.id%2 == 0}">
                                <tr class="even">
                                    <td>
                                    <g:link action="show" id="${career.id}">${career.siglas}</g:link>
                                    </td> 
                                    <td>${career.nombreCarrera}</td>
                                    <td>${career.programa}</td>
                                    <td>
                                        <ul>
                                            <g:each in="${career.students}" status="j" var="student">
                                                <li>
                                                    <g:link controller="student" action="show" id="${student.id}">${student}</g:link>
                                                </li>
                                            </g:each>
                                        </ul>
                                    </td>
                                </tr>
                            </g:if>
                            <g:else>
                                <tr class="odd">
                                   <td>
                                   <g:link action="show" id="${career.id}">${career.siglas}</g:link>
                                   </td> 
                                   <td>${career.nombreCarrera}</td>
                                   <td>${career.programa}</td>
                                   <td>
                                       <ul>
                                           <g:each in="${career.students}" status="j" var="student">
                                               <li>
                                                   <g:link controller="student" action="show" id="${student.id}">${student}</g:link>
                                               </li>
                                           </g:each>
                                       </ul>
                                   </td>  
                                </tr>
                            </g:else>
                        </g:each>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <g:paginate total="${careerCount ?: 0}" />
            </div>
        </div>
    </body>
</html>