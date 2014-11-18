var buildGraph = function() {
  var data = {
    labels: ['November', 'December', 'January', 'February', 'March', 'April'],
    datasets: [
      {
        label: 'one',
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: [100, 200, 100, 100, 100, 200]
      },
      {
        label: 'two',
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.2)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: [200, 300, 300, 250, 225, 175]
      }
    ]
  };
  var ctx = $('#skiDaysGraph').get(0).getContext('2d');
  var graph = new Chart(ctx).Line(data, {});
};

$(document).ready(function() {
  if ($('#skiDaysGraph').length > 0) {
    buildGraph();
  }
});

