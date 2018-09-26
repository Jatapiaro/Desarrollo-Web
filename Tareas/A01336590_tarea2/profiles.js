var profiles=[
		{"id":1,"nombre":"Jacobo","apellido":"Tapia"},
		{"id":2,"nombre":"Virginia","apellido":"García"},
		{"id":3,"nombre":"Ketzia","apellido":"Dante"},
		{"id":4,"nombre":"Ernesto","apellido":"Perez"},
		{"id":5,"nombre":"El","apellido":"Bustani"}
];

var html = Handlebars.templates.profilesTemplate(profiles);
document.getElementById("tabla").innerHTML+=html;

function redirect(id){
	console.log(id);
	localStorage.setItem("id", id);
	window.location.href = "profile.html";
}