/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$('#document').ready(function () {
    $('#buybutt').click(function () {
        
        $.post('../Checkout');
    });
});