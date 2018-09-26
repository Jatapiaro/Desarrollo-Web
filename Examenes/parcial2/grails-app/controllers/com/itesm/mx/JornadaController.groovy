package com.itesm.mx

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JornadaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Jornada.list(params), model:[jornadaCount: Jornada.count()]
    }

    def show(Jornada jornada) {
        respond jornada
    }

    def create() {
        respond new Jornada(params)
    }

    @Transactional
    def save(Jornada jornada) {
        if (jornada == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (jornada.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond jornada.errors, view:'create'
            return
        }

        jornada.save flush:true
        jornada.numeroJornada=jornada.id%17
        jornada.estado="Por jugar"
        jornada.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornada.id])
                redirect jornada
            }
            '*' { respond jornada, [status: CREATED] }
        }
    }

    def edit(Jornada jornada) {
        respond jornada
    }

    @Transactional
    def update(Jornada jornada) {
        if (jornada == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (jornada.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond jornada.errors, view:'edit'
            return
        }

        jornada.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornada.id])
                redirect jornada
            }
            '*'{ respond jornada, [status: OK] }
        }
    }

    @Transactional
    def delete(Jornada jornada) {

        if (jornada == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        jornada.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornada.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
