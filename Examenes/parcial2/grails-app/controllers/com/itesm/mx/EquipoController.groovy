package com.itesm.mx

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class EquipoController{

    //static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Equipo.list(params), model:[equipoCount: Equipo.count()]
    }

    def show(Equipo equipo) {
        respond equipo
    }

    def create() {
        respond new Equipo(params)
    }

    @Transactional
    def save(Equipo equipo) {
        if (equipo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (equipo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond equipo.errors, view:'create'
            return
        }

        equipo.puntaje=0
        equipo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.id])
                redirect equipo
            }
            '*' { respond equipo, [status: CREATED] }
        }
    }

    def edit(Equipo equipo) {
        respond equipo
    }

    @Transactional
    def update(Equipo equipo) {
        if (equipo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (equipo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond equipo.errors, view:'edit'
            return
        }

        equipo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.id])
                redirect equipo
            }
            '*'{ respond equipo, [status: OK] }
        }
    }

    @Transactional
    def delete(Equipo equipo) {

        if (equipo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        equipo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    /*def pending() {
        respond Equipo.last(), view: 'restView'
    }*/


}
