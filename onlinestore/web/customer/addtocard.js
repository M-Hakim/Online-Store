/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 */


/* global responsetext */

$('#document').ready(function () {
    $('#actionbtn').click(function () {
        
        $.post('../CartSerervlet', { productid: $('#productid').data('val') , quantity_input: $('#quantity_input').val() },
         function(responseText) {
if ( responseText === 'success') {
$('#someHiddenDiv').text("ok added successfully").show();
} else if (responseText === 'fail'){
    
    $('#someHiddenDiv').text("this quantity is not available").show();
}else if (responseText === 'redirect'){
   
   window.location.href = "sign_in.html";

}
} );
      
    } );});




