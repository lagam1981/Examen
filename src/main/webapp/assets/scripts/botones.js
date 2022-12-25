/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * AUTOR: Angel Arevalo
 */


$("#acceder").on("click", function(){
    var usuario = $("#usuario").val();
    var contrasena = $("#password").val();
    
    if( usuario !== "" && contrasena !== ""){
        $.post("validaAcceso.jsp",{usuario:usuario, password: contrasena}, function(data){
            var valido = data.replace(/\s+/g, '').split(" ").join("");
            if (valido === "valido"){
                document.location.href="activaSesion.jsp?usuario="+usuario;
            }else{
                creaAlerta("Los datos de acceso no son válidos");
            };
        });
    }else{
        creaAlerta("Los campos son requeridos");
        if ( usuario === "" ){
            $("#usuario").focus();
        }else{
            if ( contrasena === "" ){
                $("#password").focus();
            }
        }        
    }
});


$("#consultar").on("click", function(){
    var folio = $("#folven").val();
    if ( folio === ""){
        folio = "0";
    }
   
    if ( parseInt(folio) > 0){
        document.location.href="articulos.jsp?folven="+folio;       
    }else{
        creaAlerta("Folio inválido");
    }
    
   
});



/***********************/
$("#usuario").focus();

var totalcant  =0;
var totalventa =0;    
function acumulados(){
          
        $(".cant").each(function(){
            totalcant = totalcant + parseInt($(this).text());
        });
        
        $("#totprod").text(totalcant);
        
        $(".venta").each(function(){
            totalventa = totalventa + parseFloat($(this).text());
        });
        
        $("#totven").text("$ " + totalventa);    
}

function creaAlerta(mensaje){
    $("body").append("<div id='alerta'>"+mensaje+"</div>")
    $("#alerta").slideDown(500, function(){
       $(this).delay(5000).slideUp(500, function(){
           $("#alerta").remove();
       })
    });
}



