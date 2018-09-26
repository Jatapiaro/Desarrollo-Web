package com.itesm.mx
import grails.rest.*


//@Resource(uri = '/jornadaJson', readOnly = false, formats = ['json', 'xml'])
class Jornada {

	int numeroJornada
	String torneo
	String estado

	static hasMany = [partidos: Partido]
    static fetchMode = [partidos: 'eager']
    static constraints = {
        estado(blank:true) 
    }

    static mapping = {
        partidos lazy: false
    }

    String toString(){
    	return torneo+" - Jornada "+numeroJornada
    }

    String getLabel(){
        return torneo+" - Jornada "+numeroJornada
    }
}
