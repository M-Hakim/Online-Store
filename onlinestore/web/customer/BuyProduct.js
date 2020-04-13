/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$.post('Buy', {  quantity_input: $('#quantity_input').val() ,productid: $('#productid').data('val')} ,
//var arr = $('.spocName').map((i, e) => e.value).get();
/*var arr = [];
 $("input.activityId").each(function(){
 arr.push(this.value);
 }); */

//for (i = 0; i < l; i++) { 
// var arr = $('.spocName').map((i, e) => e.value).get();

//}
//var inputs = $('.quantity_input').val();
//$("input[name=']").each(function(){types.push($(this).data('val'))})
$('#document').ready(function () {
var l = $('.in').length;
//Initialize default array
var inputsval= $('.pid');
var inputs = $('.in');
var del = ":";

    $('#buybutton').click(function () {
        var result="" ;
        var pidval="" ;
        for (i = 0; i < l; i++) {
           result+=inputs[i].value + del;
           pidval+=($(inputsval[i]).data('val'))+ del;
        }
        
        $.post('../Buy', { quantity_input: result ,product_id:pidval},
                
                );
               
    });
});

