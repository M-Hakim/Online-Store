/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 */


/* global responsetext */

$('#document').ready(function () {
    
    if($('.product_quantity').length)
		{
			var input = $('#quantity_input');
			var incButton = $('#quantity_inc_button');
			var decButton = $('#quantity_dec_button');

			var originalVal;
			var endVal;

			incButton.on('click', function()
			{
				originalVal = input.val();
				endVal = parseFloat(originalVal) + 1;
				input.val(endVal);
			});

			decButton.on('click', function()
			{
				originalVal = input.val();
				if(originalVal > 0)
				{
					endVal = parseFloat(originalVal) - 1;
					input.val(endVal);
				}
			});
		}
    
    
    
    $('#actionbtn').click(function () {
        
        $.post('../CartSerervlet', { productid: $('#productid').data('val') , quantity_input: $('#quantity_input').val() },
         function(responseText) {
if ( responseText !== 'fail' &&  responseText !== 'redirect') {
$('#cart_size').text("("+responseText+")");
$('#someHiddenDiv').text("ok added successfully").show();
} else if (responseText === 'fail'){
    
    $('#someHiddenDiv').text("this quantity is not available").show();
}else if (responseText === 'redirect'){
   
   window.location.href = "Login.jsp";

}
} );
      
    } );});




