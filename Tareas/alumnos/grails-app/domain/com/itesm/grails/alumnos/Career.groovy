package com.itesm.grails.alumnos

class Career {

	String siglas,nombreCarrera
	int programa
	static hasMany = [students: Student]

    static constraints = {
    	siglas(unique:true,blank:false,nullable:false,maxSize:3, minSize: 3)
    	nombreCarrera(blank:false,nullable:false)
    	programa(blank:false,nullable:false,min:1990, max: 3000)
    }

    String toString(){
    	return nombreCarrera+" - "+siglas;
    }
}
