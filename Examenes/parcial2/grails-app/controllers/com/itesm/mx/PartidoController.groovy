package com.itesm.mx

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PartidoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partido.list(params), model:[partidoCount: Partido.count()]
    }

    def show(Partido partido) {
        respond partido
    }

    def create() {
        respond new Partido(params)
    }

    @Transactional
    def save(Partido partido) {
        if (partido == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (partido.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond partido.errors, view:'create'
            return
        }

        
        partido.estado = "Por jugar"
        partido.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'partido.label', default: 'Partido'), partido.id])
                redirect partido
            }
            '*' { respond partido, [status: CREATED] }
        }
    }

    def edit(Partido partido) {
        respond partido
    }

    @Transactional
    def update(Partido partido) {
        if (partido == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (partido.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond partido.errors, view:'edit'
            return
        }

        if(partido.estado == "Finalizado"){
            if(partido.marcadorLocal == partido.marcadorVisitante){
                partido.local.puntaje+=1
                partido.visitante.puntaje+=1
                partido.local.save flush:true
                partido.visitante.save flush:true
            }else if(partido.marcadorLocal > partido.marcadorVisitante){
                partido.local.puntaje+=3
                partido.local.save flush:true
            }else{
                partido.visitante.puntaje+=3
                partido.visitante.save flush:true
            }
        }
        partido.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'partido.label', default: 'Partido'), partido.id])
                redirect partido
            }
            '*'{ respond partido, [status: OK] }
        }
    }

    @Transactional
    def delete(Partido partido) {

        if (partido == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        partido.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'partido.label', default: 'Partido'), partido.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'partido.label', default: 'Partido'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
