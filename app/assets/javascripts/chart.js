$(document).ready(function() {
  var data_json = $('.arr').val();
  var data = JSON.parse(data_json);
  var options = {
    chart: {
      height: 380,
      width: "100%",
      type: 'candlestick'
    },
    series: [{
    data: data
    }],
    xaxis: {
    type: 'numeric'
    }
  }

  var chart = new ApexCharts(document.querySelector("#chart"), options);

  chart.render();
});