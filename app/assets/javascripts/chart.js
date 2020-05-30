$(document).ready(function() {
  var data_json = $('.arr').val();
  var data = JSON.parse(data_json);
  var options = {
    series: [{
    data: data
    }],
    chart: {
      height: 350,
      width:"100%",
      type: 'candlestick',
    },
    title: {
      text: 'USD',
      align: 'left'
    },
    tooltip: {
      enabled: true,
    },
    xaxis: {
      type: 'category',
      labels: {
            formatter: function(val) {
              return dayjs.unix(val).format('MMM DD \'YY')
            }
      }
    },
    yaxis: {
      tooltip: {
            enabled: true
      }
    }
  };
  var chart = new ApexCharts(document.querySelector("#chart"), options);
  chart.render();
});

