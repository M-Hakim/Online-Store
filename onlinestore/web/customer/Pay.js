/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#document').ready(function () {
$('#push').click(function () {

$.get('../CreditLimit',
        function(responseText) {
        if (responseText === 'you have exceeded your credit limit please remove som items') {
        $('#someHidden').show();
                }
            
        },);
});});


