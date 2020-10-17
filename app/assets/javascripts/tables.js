$(document).on('turbolinks:load', function () {
  console.log("event");
    $.ajax({
      url: '/search',
      dataType: "JSON" ,
      success: function(data) {
        $('#myTable').DataTable({
          'data': data,
          "columnDefs": [ {
            "targets": 2,
            "createdCell": function (td, cellData, rowData, row, col) {
              $(td).html("<a href='/stocks/"+rowData[0]+"'>"+cellData+"</a>");
            }
          }]
        });
      }
    });
});
