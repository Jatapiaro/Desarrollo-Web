'use strict';

/**
 * @ngdoc function
 * @name parcial1App.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the parcial1App
 */
angular.module('parcial1App')
  .controller('MainCtrl', function ($scope,$http,$interval,$window) {

    $scope.torneo=""
    $scope.numeroJornada=""
    $scope.partidos=[];
  	$scope.terminados=[];
  	$scope.jugando=[];
  	$scope.jugar=[]

    $scope.access_token=""
    $scope.logeado=false

    $http.post('http://localhost:8080/api/login', {
        username: "admin",
        password: "admin"
    }).then(function (response) {
        $scope.access_token=response.data.access_token;
        console.log(response.data.access_token);
        var req = {
          method: 'GET',
          url: 'http://localhost:8080/jornadaActual',
          headers: {
            'Authorization': "Bearer "+$scope.access_token
          }
        }
        $scope.logeado=true
        $http(req).then(function(res){
            var jornadaData=res.data;
            $scope.torneo=jornadaData.torneo;
            $scope.jornada=jornadaData.numeroJornada;
            $scope.partidos=jornadaData.partidos;
            $scope.partidosCurrent=jornadaData.partidos;
            for (var i = 0 ; i < $scope.partidos.length; i++) {
                var p=$scope.partidos[i];
                if(p.estado=='Finalizado'){
                    $scope.terminados.push(p);
                }else if(p.estado=='Jugando'){
                    $scope.jugando.push(p);
                }else{
                    $scope.jugar.push(p);
                }
            }
        });
    });



    $interval(function(){

        var req = {
          method: 'GET',
          url: 'http://localhost:8080/jornadaActual',
          headers: {
            'Authorization': "Bearer "+$scope.access_token
          }
        }

        $http(req).then(function(res){
            var jornadaData=res.data;
            console.log(jornadaData);
            $scope.torneo=jornadaData.torneo;
            $scope.jornada=jornadaData.numeroJornada;
            $scope.partidos=jornadaData.partidos;
            for (var i = 0 ; i < $scope.partidos.length; i++) {
                
                var p=$scope.partidos[i];
                /*
                *Si esta finalizado se busca si se encontro ya en la lsita
                *Si no, significa que de los no empezados o los empezados
                *hay que pasarlo a finalizado.
                */
                if(p.estado=='Finalizado'){
                   
                    var isOn=false;
                    for(var j=0;j<$scope.terminados.length;j++){
                        if(p.id==$scope.terminados[j].id){
                            isOn=true;
                            break;
                        }       
                    }

                    if(isOn==false){
                        var encontrado=false;
                        var where=-1;
                        for(var j=0;j<$scope.jugar.length;j++){
                            if(p.id==$scope.jugar[j].id){
                                //console.log("Hey aca");
                                encontrado=true;
                                where=j;
                                break;
                            }
                        }
                        /*
                        *De los que estan por jugar mandarlo a jugados.
                        */
                        if(encontrado){
                            $scope.jugar.splice(where,1);
                            $scope.terminados.push(p)
                        }
                        /*
                        *Si no se encontro, hacer el proceso para los que estan 
                        en juego
                        */
                        var encontrado2=false;
                        for(var j=0;encontrado==false && j<$scope.jugando.length;j++){
                            if(p.id==$scope.jugando[j].id){
                                encontrado2=true;
                                where=j;
                                break;
                            }
                        }
                        if(encontrado2){
                            $scope.jugando.splice(where,1);
                            $scope.terminados.push(p)
                        }
                    }

                }else if(p.estado=='Jugando'){
                    /*
                    *Buscar en los que se estan jugando
                    */

                    var isOn=false;
                    for(var j=0;j<$scope.jugando.length;j++){

                        if(p.id==$scope.jugando[j].id){
                            if($scope.jugando[j].marcadorLocal != p.marcadorLocal){
                                $scope.jugando[j].marcadorLocal = p.marcadorLocal;
                                $scope.jugando[j].golLocal = true;
                            }else if($scope.jugando[j].marcadorVisitante != p.marcadorVisitante){
                                $scope.jugando[j].marcadorVisitante = p.marcadorVisitante;
                                $scope.jugando[j].golVisita = true;
                            }
                            isOn=true;
                            
                        }

                        if($scope.jugando[j].golLocal){
                            if($scope.jugando[j].segundosLocal<4){
                                $scope.jugando[j].segundosLocal+=1;
                                console.log($scope.jugando[j].segundosLocal)
                            }else{
                                $scope.jugando[j].segundosLocal=0;
                                $scope.jugando[j].golLocal=false;
                            }
                        }

                        if($scope.jugando[j].golVisita){
                            if($scope.jugando[j].segundosVisita<4){
                                $scope.jugando[j].segundosVisita+=1;
                            }else{
                                $scope.jugando[j].golVisita=false;
                                $scope.jugando[j].segundosVisita=0;
                            }
                        }

                    }

                    if(isOn==false){
                        /*
                        *Buscar en los no empezados
                        *Buscar en los empezados, y actualizar la información
                        */
                        var encontrado=false;
                        var where=-1;
                        for(var j=0;j<$scope.jugar.length;j++){
                            if(p.id==$scope.jugar[j].id){
                                //console.log("Hey aca");
                                encontrado=true;
                                where=j;
                                break;
                            }
                        }
                        /*
                        *De los que estan por jugar mandarlo a jugando.
                        */
                        if(encontrado){
                            $scope.jugar.splice(where,1);
                            $scope.jugando.push(p)
                        }
                    }

                }
            }
        });

    },1000)





});
