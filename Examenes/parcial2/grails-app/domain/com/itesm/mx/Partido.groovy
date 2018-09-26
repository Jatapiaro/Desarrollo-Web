package com.itesm.mx

import grails.rest.*

//@Resource(uri = '/partidoJson', readOnly = false, formats = ['json', 'xml'])
class Partido{
 
	Equipo local
    int marcadorLocal
    Equipo visitante
    int marcadorVisitante
    String estado


    static belongsTo = [jornada: Jornada]

    static constraints = {
        jornada(blank:false,nullable:true)
        local(blank:false,nullable:true)
        marcadorLocal()
        marcadorVisitante()
        visitante(blank:false,nullable:true)
        estado(blank:false,nullable:true)
    }

    String toString(){
        if(local!=null && visitante!=null){
            return local.nombre+" VS "+visitante.nombre
        }else{
                return ""
        }
    }


}
