<%@ page import="com.itesm.grails.alumnos.Student"%>
<%@ page import="com.itesm.grails.alumnos.Campus"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-campus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-campus" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <!--<f:table collection="${campusList}" />-->


            <div id="list-career" class="content scaffold-list" role="main">
                <h1>Lista de campus</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Siglas</th>
                            <th>Nombre del Campus</th>
                            <th>Estudiantes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${Campus.list()}" status="i" var="campus">
                            <g:if test="${campus.id%2 == 0}">
                                <tr class="even">
                                    <td>
                                    <g:link action="show" id="${campus.id}">${campus.siglas}</g:link>
                                    </td> 
                                    <td>${campus.nombreCampus}</td>
                                    <td>
                                        <ul>
                                            <g:each in="${campus.students}" status="j" var="student">
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
                                   <g:link action="show" id="${campus.id}">${campus.siglas}</g:link>
                                   </td> 
                                   <td>${campus.nombreCampus}</td>
                                   <td>
                                       <ul>
                                           <g:each in="${campus.students}" status="j" var="student">
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
                <g:paginate total="${campusCount ?: 0}" />
            </div>
        </div>
    </body>
</html>