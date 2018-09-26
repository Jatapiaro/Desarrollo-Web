package com.itesm.grails.alumnos

class Student {

	String matricula,nombreCompleto,direccion,correoElectronico;
	Career career;
	Campus campus;

    static constraints = {
    	matricula(blank:true,nullable:true)
    	nombreCompleto(blank:false,nullable:false,maxSize:750, minSize: 20)
    	direccion(blank:false,nullable:false,maxSize:150, minSize: 20)
    	correoElectronico(email:true,blank:false,nullable:false)
    }

    String toString(){
    	return matricula+" - "+nombreCompleto;
    }
}
