(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['profilePageTemplate'] = template({"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {
    var helper, alias1=depth0 != null ? depth0 : {}, alias2=helpers.helperMissing, alias3="function", alias4=container.escapeExpression;

  return "	  	<div class=\"page-header\">\n	  		<h1>ITESM Stats</h1>\n	  		<p>Stats de "
    + alias4(((helper = (helper = helpers.nombre || (depth0 != null ? depth0.nombre : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"nombre","hash":{},"data":data}) : helper)))
    + "</p>\n	  	</div>\n\n	  	<div class=\"row info\">\n\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-2\">\n	  			<img src='"
    + alias4(((helper = (helper = helpers.imag || (depth0 != null ? depth0.imag : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"imag","hash":{},"data":data}) : helper)))
    + "' alt=\"\" width=\"150\" height=\"150\" />\n	  		</div>\n\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-2\">\n	  			<h2>#"
    + alias4(((helper = (helper = helpers.numero || (depth0 != null ? depth0.numero : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"numero","hash":{},"data":data}) : helper)))
    + "</h2>\n	  		</div>\n\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-2\">\n	  			<h4>"
    + alias4(((helper = (helper = helpers.nombre || (depth0 != null ? depth0.nombre : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"nombre","hash":{},"data":data}) : helper)))
    + " "
    + alias4(((helper = (helper = helpers.apellido || (depth0 != null ? depth0.apellido : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"apellido","hash":{},"data":data}) : helper)))
    + "</h4>\n	  			<p class=\"blue-font\">"
    + alias4(((helper = (helper = helpers.ocupacion || (depth0 != null ? depth0.ocupacion : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"ocupacion","hash":{},"data":data}) : helper)))
    + " / "
    + alias4(((helper = (helper = helpers.empresa || (depth0 != null ? depth0.empresa : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"empresa","hash":{},"data":data}) : helper)))
    + "</p>\n	  		</div>\n\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-2\">\n	  			<p>"
    + alias4(((helper = (helper = helpers.peso || (depth0 != null ? depth0.peso : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"peso","hash":{},"data":data}) : helper)))
    + " lbs</p>\n	  			<p>Edad "
    + alias4(((helper = (helper = helpers.edad || (depth0 != null ? depth0.edad : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"edad","hash":{},"data":data}) : helper)))
    + "</p>\n	  			<p>Fecha de nacimiento: "
    + alias4(((helper = (helper = helpers.nacimiento || (depth0 != null ? depth0.nacimiento : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"nacimiento","hash":{},"data":data}) : helper)))
    + "</p>\n	  			<p>Prior: "
    + alias4(((helper = (helper = helpers.prior || (depth0 != null ? depth0.prior : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"prior","hash":{},"data":data}) : helper)))
    + "</p>\n	  			<p>DF</p>\n	  		</div>\n\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-2\">\n	  			<img src=\""
    + alias4(((helper = (helper = helpers.img2 || (depth0 != null ? depth0.img2 : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"img2","hash":{},"data":data}) : helper)))
    + "\" \n	  			alt=\"\" width=\"150\" height=\"150\"/>\n	  		</div>\n\n	  	</div>\n\n	  	<div class=\"row stats\">\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-12\">\n	  			<p>Stats de "
    + alias4(((helper = (helper = helpers.nombre || (depth0 != null ? depth0.nombre : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"nombre","hash":{},"data":data}) : helper)))
    + "</p>\n	  		</div>\n	  	</div>\n\n	  	<div class=\"row season\">\n	  		<div class=\".col-xs-12 .col-sm-12 .col-lg-12 col-md-12\">\n	  			<p>Stats del Semestre</p>\n	  		</div>\n	  	</div>\n\n	  	<div class=\"row numbers\">\n	  		<div class=\"col-md-6\">Semestre</div>\n	  		<div class=\"col-md-1\">Escuela</div>\n	  		<div class=\"col-md-1\">Edad</div>\n	  		<div class=\"col-md-1\">WEB</div>\n	  		<div class=\"col-md-1\">LAB</div>\n	  		<div class=\"col-md-1\">LANG</div>\n	  		<div class=\"col-md-1\">PTS</div>\n	  	</div>\n\n\n	  	<div class=\"row\">\n	  		<div class=\"col-md-6\"><p class=\"blue-font2\">Ago-Dic 2016</p></div>\n	  		<div class=\"col-md-1\">CCM</div>\n	  		<div class=\"col-md-1\">"
    + alias4(((helper = (helper = helpers.edad || (depth0 != null ? depth0.edad : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"edad","hash":{},"data":data}) : helper)))
    + "</div>\n	  		<div class=\"col-md-1\">N/A</div>\n	  		<div class=\"col-md-1\">N/A</div>\n	  		<div class=\"col-md-1\">"
    + alias4(((helper = (helper = helpers.lang || (depth0 != null ? depth0.lang : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"lang","hash":{},"data":data}) : helper)))
    + "</div>\n	  		<div class=\"col-md-1\">100</div>\n	  	</div>\n\n	  	<div class=\"row career\">\n	  		<div class=\"col-md-6\">Carrera: </div>\n	  		<div class=\"col-md-1\"></div>\n	  		<div class=\"col-md-1\"></div>\n	  		<div class=\"col-md-1\">987</div>\n	  		<div class=\"col-md-1\">986</div>\n	  		<div class=\"col-md-1\">39.0</div>\n	  		<div class=\"col-md-1\">27.2</div>\n	  	</div>\n\n	  	<br><a href=\"index.html\">Regresar a perfiles</a>\n";
},"useData":true});
})();