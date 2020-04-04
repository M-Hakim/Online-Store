/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



//$('#document').ready(function () {
//    $('#actionbtn').click(function () {
//        $.ajax({
//            url: 'GetUserServlet',
//            data: {
//                productName: $('#productName').val(),
//                qty: $('#qty').val()
//            },
//
//            success: function (responseText) {
//                $('#ajaxGetUserServletResponse').text(responseText);
//            },
//            type: 'GET'
//
//        });
//    });
//});



$('#document').ready(function () {
    $('#actionbtn').click(function () {
        $.get('GetUserServlet', {productName: $('#productName').val(), qty: $('#qty').val()},
                function (responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
                });
    });
});


//
//jQuery.ajax({
//    url:URL,
//    data:{"key1":"value1","key2":"value2"},
//    type:'POST',
//    dataType : 'xml',   /* use 'jsonp' for cross domain*/
//    success:function(data, textStatus, jqXHR){
//        // access response data
//    },
//    error:function(data, textStatus, jqXHR){
//        console.log('Service call failed!');
//    }
//});



//$.post("yourServletUrl",{"param1":"1","param2":"2"},function(data){},"json");
//if(result === "no_errors") location.href = "http://www.example.com/ThankYou.html"
//success: function(data){
//   if(data.success == true){ // if true (1)
//      setTimeout(function(){// wait for 5 secs(2)
//           location.reload(); // then reload the page.(3)
//      }, 5000); 
//   }
//}