package parcial2

class UrlMappings {

    static mappings = {

        //"/info"(resources:"info")
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/jornadaActual"(controller:'Info', action: 'jornadaActual')
        "/jornadaJson"(resources:"Jornada")
        "/partidoJson"(resources:"Partido")
        "/equipoJson"(resources:"Equipo")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
