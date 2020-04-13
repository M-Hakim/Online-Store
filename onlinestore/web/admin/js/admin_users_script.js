/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const $tableID = $('#table');
 const $BTN = $('#export-btn');
 const $EXPORT = $('#export');

 const newTr = `
<tr class="hide" id="0">
  <td class="pt-3-half">1</td>
  <td class="pt-3-half" contenteditable="true"></td>
  <td class="pt-3-half" contenteditable="true"></td>
  <td class="pt-3-half">
    <select class="browser-default custom-select">
      <option value="0" selected>Customer</option>
      <option value="1">Administrator</option>
    </select>
  </td>
  <td class="pt-3-half" contenteditable="true"></td>
  <td class="pt-3-half" contenteditable="true"></td>
  <td class="pt-3-half" contenteditable="true"></td>
    <td class="pt-3-half" contenteditable="true"></td>
    <td class="pt-3-half" contenteditable="true"></td>
    <td class="pt-3-half" contenteditable="true"></td>
  <td>
  <span class="table-submit"><button type="button" class="btn btn-primary btn-rounded btn-sm my-0 waves-effect waves-light">Submit</button></span>
  </td>
  <td>
    <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0 waves-effect waves-light">Remove</button></span>
  </td>
</tr>`;

 $('.table-add').on('click', 'i', () => {

  //  const $clone = $tableID.find('tbody tr').last().clone(true).removeClass('hide table-line');

    if ($tableID.find('tbody tr').length === 0) {

      $('tbody').append(newTr);
    }
    else{
  const $clone = $tableID.find('tbody tr').last();
  var newOrder = (parseInt($clone.find('td:eq(0)').text())) + 1;
   $('tbody').append(newTr);
   $tableID.find('tbody tr').last().find('td:eq(0)').html(newOrder);
    }
  //  $tableID.find('table').append($clone);
 });

 $tableID.on('click', '.table-remove', function () {
     var currentRow = $(this).closest('tr');
     var userId = currentRow.attr("id");
     var clickedBtn = $(this);
     if(userId === "0")
        $(this).parents('tr').detach();
    else{
        $.post('../UserDeleteServlet', {
                user_id: userId
            },
        function (response) {
            if(response === "success")
                clickedBtn.parents('tr').detach();
            
            alert(response);
        });
    }
 });
 $tableID.on('click', '.table-submit', function () {
    var currentRow = $(this).closest('tr');
    var trid = $(this).closest('tr').attr('id');
    var userId = currentRow.attr("id");

    var userName = currentRow.find('td:eq(1)').text();
    var password = currentRow.find('td:eq(2)').text();
    var role = currentRow.find('td:eq(3)').children(0).children("option:selected").val();
    var credit = currentRow.find('td:eq(4)').text();
    var email = currentRow.find('td:eq(5)').text();
    var birthday = currentRow.find('td:eq(6)').text();
    var job = currentRow.find('td:eq(6)').text();
    var address = currentRow.find('td:eq(7)').text();
    var interests = currentRow.find('td:eq(8)').text();

    //POST request
    $.post('../UserUpdateServlet', {
      user_id: userId,
      user_name: userName,
      pass: password,
      is_admin: role,
      credit: credit,
      email: email,
      birthday: birthday,
      job: job,
      address: address,
      interests: interests
    },
    function (response) {
        if(response !== "failed"){
            currentRow.attr("id",response);
            alert("success, new ID = " + response);
        }
        else
            alert("failed");
    });
});



 // A few jQuery helpers for exporting only
 jQuery.fn.pop = [].pop;
 jQuery.fn.shift = [].shift;

 $BTN.on('click', () => {

   const $rows = $tableID.find('tr:not(:hidden)');
   const headers = [];
   const data = [];

   // Get the headers (add special header logic here)
   $($rows.shift()).find('th:not(:empty)').each(function () {

     headers.push($(this).text().toLowerCase());
   });

   // Turn all existing rows into a loopable array
   $rows.each(function () {
     const $td = $(this).find('td');
     const h = {};

     // Use the headers from earlier to name our hash keys
     headers.forEach((header, i) => {

       h[header] = $td.eq(i).text();
     });

     data.push(h);
   });

   // Output the result
   $EXPORT.text(JSON.stringify(data));
 });
