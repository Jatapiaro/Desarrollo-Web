import com.itesm.grails.alumnos.*;

class BootStrap {

    def init = { servletContext ->
    	new Career(siglas:'ITC',nombreCarrera:'Ingeniería en Tecnologías Computacionales',programa:2011).save()
    	new Career(siglas:'IME',nombreCarrera:'Ingeniero Mécanico Electricista',programa:2011).save()
    	new Career(siglas:'IMA',nombreCarrera:'Ingeniero Mécanico Administrador',programa:2011).save()
    	new Campus(siglas:'CCM-1',nombreCampus:'Ciudad de México').save();
    	new Campus(siglas:'CSF-1',nombreCampus:'Santa Fe').save();

    	
    }
    def destroy = {
    }
}