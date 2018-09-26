'use strict';

/**
 * @ngdoc function
 * @name parcial1App.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the parcial1App
 */
angular.module('parcial1App')
  .controller('MainCtrl', function ($scope,$http,$interval) {

  	$scope.terminados=[];
  	$scope.jugando=[];
  	$scope.jugar=[];
    
    $http.get('partidos.json').then(function(res){

        var jornadaData = res.data.jornada;
        $scope.partidos=jornadaData.partidos;
        $scope.torneo=jornadaData.torneo;
        $scope.jornada=jornadaData.jornada;

        for (var i = 0 ; i < $scope.partidos.length; i++) {
        	var p=$scope.partidos[i];
        	if(p.estatus=='Terminado'){
        		$scope.terminados.push(p);
        	}else if(p.estatus=='Jugando'){
        		$scope.jugando.push(p);
        	}else{
        		$scope.jugar.push(p);
        	}
        }
        $scope.fecha=jornadaData.fecha;                
    });

    /*
    *Funcion para verificar partidos en juego
    */
    $interval(function() {

        /*
        *Se sacan dos random, uno que indica si hay gol
        *Si hay un gol, se saca otro random y se decide si
        *el gol fue para el equipo local o para el visitante
        */
        var one=Math.floor((Math.random() * 10) + 1);
        if(one>5){

            /*
            *Se obtiene un partido al azar, que equivale a
            *una accion de gol en un partido.
            */
            
            var partidoSeleccionado=Math.floor(Math.random() * $scope.jugando.length);    
            
            /*
            *Mayor a cinco para gol de local
            *Menor igual a 5 para visita
            */
            var two=Math.floor((Math.random() * 10) + 1);
            if(two<=5){
                $scope.jugando[partidoSeleccionado].golLocal=true;
                $scope.jugando[partidoSeleccionado].golesLocal++;
            }else{
                $scope.jugando[partidoSeleccionado].golVisita=true;
                $scope.jugando[partidoSeleccionado].golesVisita++;
            }
        }

    },5000)

    /*
    *Actualiza el timer actual
    *Se simula un partido de 90 minutos en solo 2 minutos
    *Haciendo "equivalente" 666ms a 1 minuto.
    */
    $interval(function() {
        for (var i = 0; i < $scope.jugando.length; i++) {
            if(($scope.jugando[i].minutoActual+666)>60000){
                var partido=$scope.jugando[i];
                partido.golLocal=false;
                partido.golVisita=false;
                partido.tiempoMinutos=90;
                $scope.jugando.splice(i,1);
                $scope.terminados.push(partido);
            }else{
                if($scope.jugando[i].golLocal){
                    if($scope.jugando[i].segundosGolLocal<4){
                        $scope.jugando[i].segundosGolLocal++;
                    }else{
                        $scope.jugando[i].segundosGolLocal=0;
                        $scope.jugando[i].golLocal=false;
                    }
                }else if($scope.jugando[i].golVisita){
                    if($scope.jugando[i].segundosGolVisita<4){
                        $scope.jugando[i].segundosGolVisita++;
                    }else{
                        $scope.jugando[i].segundosGolVisita=0;
                        $scope.jugando[i].golVisita=false;
                    }
                }
                $scope.jugando[i].minutoActual+=333;
                $scope.jugando[i].tiempoMinutos=Math.ceil(((90*$scope.jugando[i].minutoActual)/60000));
            }
        }
    },666)

    /*
    *Actualiza los juegos que aun no comienzan
    *Sigue un "algoritmo" similar al de los goles para activar un partido
    */
    $interval(function(){

        /*
        *Se obtiene un random para ver si un partido es activado
        */
        var one=Math.floor((Math.random() * 10) + 1);
        if(one>5){

            /*
            *Se obtiene un partido al azar,para ser activado
            */
            if($scope.jugar.length>0){
                var partidoSeleccionado=Math.floor(Math.random() * $scope.jugar.length);  
                var partido=$scope.jugar[partidoSeleccionado];  
                $scope.jugar.splice(partidoSeleccionado,1);
                $scope.jugando.push(partido);
            }
        }

    },10000)



});
