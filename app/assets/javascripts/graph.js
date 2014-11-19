var buildGraph = function() {
  var chart_labels = [];
  var chart_data = [];
  $.each($('#chart_values').find('#entry .month'), function(idx, val) { chart_labels.push($(val).text()); });
  $.each($('#chart_values').find('#entry .vertical'), function(idx, val) { chart_data.push($(val).text()); });
  var data = {
    labels: chart_labels,
    datasets: [
      {
        label: 'Vertical',
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.2)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: chart_data
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

