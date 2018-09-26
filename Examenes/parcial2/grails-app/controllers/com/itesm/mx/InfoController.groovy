package com.itesm.mx
 
import grails.rest.RestfulController
import grails.converters.JSON
import com.itesm.mx.*
import grails.plugin.springsecurity.annotation.Secured
 
@Secured(["ROLE_USER","ROLE_ADMIN"])
class InfoController extends RestfulController {
   
   /*
   http://docs.grails.org/latest/guide/introduction.html#whatsNewCors
   */
   	static responseFormats = ['json']
    
    InfoController() {
        super(Jornada)
    }


   	def jornadaActual() {
        respond Jornada.findByEstado("En curso"), view: 'index'
	  }
}