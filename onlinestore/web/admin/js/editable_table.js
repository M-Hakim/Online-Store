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
      <option value="0" selected>Select Category</option>
      <option value="1">mobiles</option>
      <option value="2">laptops</option>
    </select>
  </td>
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
//  newOrder++;
//  alert(newOrder);
   $('tbody').append(newTr);
   $tableID.find('tbody tr').last().find('td:eq(0)').html(newOrder);
    }
  //  $tableID.find('table').append($clone);
 });

 $tableID.on('click', '.table-remove', function () {

   $(this).parents('tr').detach();
 });
 $tableID.on('click', '.table-submit', function () {
    var currentRow = $(this).closest('tr');
    var trid = $(this).closest('tr').attr('id');
    var productId = currentRow.attr("id");

    var productName = currentRow.find('td:eq(1)').text();
    var quantity = currentRow.find('td:eq(2)').text();
    var categoryId = currentRow.find('td:eq(3)').children(0).children("option:selected").val();
    var description = currentRow.find('td:eq(4)').text();
    var priceValue = currentRow.find('td:eq(5)').text();
    var imgurl = currentRow.find('td:eq(6)').text();

    //POST request
    $.post('../ProductUpdateServlet', {
      product_id: productId,
      product_name: productName,
      qty: quantity,
      catId: categoryId,
      desc: description,
      price: priceValue,
      img: imgurl
    },
    function (response) {
        if(response != "failed"){
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
