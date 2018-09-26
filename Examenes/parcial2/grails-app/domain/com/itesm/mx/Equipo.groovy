package com.itesm.mx
import grails.rest.*

//@Resource(uri = '/equipoJson', readOnly = false, formats = ['json', 'xml'])
class Equipo {

	String nombre,imagenURL
	int puntaje


	static mapping = {
    	sort puntaje: "desc" 
	}

    static constraints = {
        nombre(blank:false)
        puntaje()
        imagenURL(blank:false)   
    }

    String toString(){
    	return nombre
    }


}
