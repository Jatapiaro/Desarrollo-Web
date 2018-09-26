'use strict';

/**
 * @ngdoc function
 * @name a01336590Tarea3App.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the a01336590Tarea3App
 */

angular.module('a01336590Tarea3App')
  .controller('MainCtrl', function ($scope) {

  	$scope.id=0;
  	$scope.auxId=0;
  	$scope.nombre='';
  	$scope.apellido='';
  	$scope.nomina='';
  	$scope.query='';
  	$scope.departamento='';
    $scope.trabajadores = [];
    $scope.trabajadoresView=[];
    $scope.trabajadoresSearch=[];

    $scope.add=function(){
    	$scope.id+=1;
    	var w={
    		"id":$scope.id,
    		"nomina":$scope.nomina,
    		"nombre":$scope.nombre,
    		"apellido":$scope.apellido,
    		"departamento":$scope.departamento}
    	$scope.trabajadores.push(w);
    	$scope.nombre='';
    	$scope.apellido='';
    	$scope.nomina='';
    	$scope.departamento='';
    	$("#registroModal").modal("hide");
    	if($scope.query==''){
    		$scope.trabajadoresView=$scope.trabajadores;
    	}else{
    		$scope.trabajadoresView.push(w);
    	}
    }

    $scope.edit=function(){
    	var i=$scope.getSelectedItem($scope.auxId);
    	$scope.trabajadores[i].nombre=$scope.nombre;
    	$scope.trabajadores[i].apellido=$scope.apellido;
    	$scope.trabajadores[i].nomina=$scope.nomina;
    	$scope.trabajadores[i].departamento=$scope.departamento;
    	$scope.nombre='';
    	$scope.apellido='';
    	$scope.nomina='';
    	$scope.departamento='';
    	$scope.auxId=0;
    	$("#editModal").modal("hide");
    	$scope.busqueda();
    }

    $scope.delete=function(id){
    	var i=$scope.getSelectedItem(id);
    	$scope.trabajadores.splice(i,1);
    	$scope.trabajadoresView=$scope.trabajadores;
    	$scope.busqueda();
    }

    $scope.getSelectedItem=function(id){
    	for(var i=0;i<$scope.trabajadores.length;i++){
    		if($scope.trabajadores[i].id==id){
    			return i;
    		}
    	}
    	return -1;
    }

    $scope.find=function(id){

    	var i=$scope.getSelectedItem(id);
    	var w=$scope.trabajadores[i];
    	$scope.auxId=w.id;
    	$scope.nombre=w.nombre;
  		$scope.apellido=w.apellido;
  		$scope.nomina=w.nomina;
  		$scope.departamento=w.departamento;
  		$("#editModal").modal("show");

    }

    $scope.showRModal=function(){
    	$("#registroModal").modal("show");
    }

    $scope.busqueda=function(){
    	if($scope.query==''){
    		$scope.trabajadoresView=$scope.trabajadores;
    	}else{
    		$scope.trabajadoresView=[];
    		for(var i=0;i<$scope.trabajadores.length;i++){
    			if($scope.trabajadores[i].nomina.includes($scope.query) || $scope.trabajadores[i].nombre.includes($scope.query) || $scope.trabajadores[i].apellido.includes($scope.query) || $scope.trabajadores[i].departamento.includes($scope.query)){
    				$scope.trabajadoresView.push($scope.trabajadores[i]);
    			}
    		}
    	}
    }

  });
