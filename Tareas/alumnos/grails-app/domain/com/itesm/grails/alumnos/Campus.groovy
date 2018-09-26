package com.itesm.grails.alumnos

class Campus {

	String siglas,nombreCampus
	static hasMany = [students: Student]

    static constraints = {
    	siglas(unique:true,blank:false,nullable:false,maxSize:5, minSize: 5)
    	nombreCampus(blank:false,nullable:false)
    }

    String toString(){
    	return nombreCampus+" - "+siglas;
    }
}
