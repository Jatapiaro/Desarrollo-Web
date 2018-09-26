import com.itesm.mx.*

class BootStrap {


    def init = { servletContext ->



        def userRole=new Role(authority:"ROLE_USER").save(flush:true)
        def adminRole=new Role(authority:"ROLE_ADMIN").save(flush:true)

        def user=new User(username:"user",password:"user",rol:userRole).save(flush: true)
        def admin=new User(username:"admin",password:"admin",rol:adminRole).save(flush: true)

        new UserRole(user:user,role:userRole).save(flush:true)
        new UserRole(user:admin,role:adminRole).save(flush:true)

        Equipo uanl=new Equipo(nombre:"Tigres",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/16/16.png").save()
        Equipo tij=new Equipo(nombre:"Tijuana",puntaje:3,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/5/5.png").save()
        Equipo pach=new Equipo(nombre:"Pachuca",puntaje:3,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/11/11.png").save()
        Equipo ver=new Equipo(nombre:"Veracruz",puntaje:0,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/3107/3107.png").save()
        Equipo gdj=new Equipo(nombre:"Guadalajara",puntaje:0,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/7/7.png").save()
        Equipo ame=new Equipo(nombre:"América",puntaje:3,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/1/1.png").save()
        Equipo nec=new Equipo(nombre:"Nécaxa",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/29/29.png").save()
        Equipo tol=new Equipo(nombre:"Toluca",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/17/17.png").save()
        Equipo leon=new Equipo(nombre:"León",puntaje:0,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/9/9.png").save()
        Equipo unam=new Equipo(nombre:"UNAM",puntaje:3,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/18/18.png").save()
        Equipo pue=new Equipo(nombre:"Puebla",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/12/12.png").save()
        Equipo mty=new Equipo(nombre:"Monterrey",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/14/14.png").save()
        Equipo atl=new Equipo(nombre:"Atlas",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/10445/10445.png").save()
        Equipo caz=new Equipo(nombre:"Cruz Azul",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/6/6.png").save()
        Equipo mor=new Equipo(nombre:"M. Morelia",puntaje:0,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/10/10.png").save()
        Equipo quer=new Equipo(nombre:"Querétaro",puntaje:3,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/3106/3106.png").save()
        Equipo san=new Equipo(nombre:"S. Laguna",puntaje:1,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/15/15.png").save()
        Equipo jag=new Equipo(nombre:"Jaguares",puntaje:0,imagenURL:"https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos35x35/3108/3108.png").save()

        Jornada j1=new Jornada(torneo:"Apertura 2016",estado:"Finalizada").save()
        j1.numeroJornada=j1.id%17
        j1.save()

        new Partido(jornada:j1,local:tij,visitante:mor,
            marcadorLocal:2,marcadorVisitante:0,estado:"Finalizado").save()
        new Partido(jornada:j1,local:quer,visitante:ver,
            marcadorLocal:2,marcadorVisitante:0,estado:"Finalizado").save()
        new Partido(jornada:j1,local:mty,visitante:pue,
            marcadorLocal:1,marcadorVisitante:1,estado:"Finalizado").save()
        new Partido(jornada:j1,local:atl,visitante:tol,
            marcadorLocal:1,marcadorVisitante:1,estado:"Finalizado").save()
        new Partido(jornada:j1,local:pach,visitante:leon,
            marcadorLocal:5,marcadorVisitante:1,estado:"Finalizado").save()
        new Partido(jornada:j1,local:nec,visitante:caz,
            marcadorLocal:0,marcadorVisitante:0,estado:"Finalizado").save()
        new Partido(jornada:j1,local:ame,visitante:jag,
            marcadorLocal:2,marcadorVisitante:0,estado:"Finalizado").save()
        new Partido(jornada:j1,local:unam,visitante:gdj,
            marcadorLocal:1,marcadorVisitante:0,estado:"Finalizado").save()
        new Partido(jornada:j1,local:san,visitante:uanl,
            marcadorLocal:0,marcadorVisitante:0,estado:"Finalizado").save()

        Jornada j2=new Jornada(torneo:"Apertura 2016",estado:"Por jugar").save()
        j2.numeroJornada=j2.id%17
        j2.save()

        new Partido(jornada:j2,local:ver,visitante:unam,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:jag,visitante:quer,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:mor,visitante:nec,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:uanl,visitante:mty,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:pach,visitante:atl,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:ame,visitante:san,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:gdj,visitante:caz,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:tol,visitante:tij,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()
        new Partido(jornada:j2,local:pue,visitante:leon,
            marcadorLocal:0,marcadorVisitante:0,estado:"Por jugar").save()

    }
    def destroy = {
    }
}
