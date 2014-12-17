var buildTouringGraph = function() {
  var touring_chart_labels = [];
  var touring_chart_data = [];
  $.each($('#touring_chart_values').find('#entry .month'), function(idx, val) { touring_chart_labels.push($(val).text()); });
  $.each($('#touring_chart_values').find('#entry .vertical'), function(idx, val) { touring_chart_data.push($(val).text()); });
  var data = {
    labels: touring_chart_labels,
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
        data: touring_chart_data
      }
    ]
  };
  var ctx = $('#touringDaysGraph').get(0).getContext('2d');
  var graph = new Chart(ctx).Line(data, {});
};

var buildDaysGraph = function() {
  var days_chart_labels = [];
  var days_chart_data = [];
  $.each($('#days_chart_values').find('#entry .month'), function(idx, val) { days_chart_labels.push($(val).text()); });
  $.each($('#days_chart_values').find('#entry .days'), function(idx, val) { days_chart_data.push($(val).text()); });
  var data = {
    labels: days_chart_labels,
    datasets: [
      {
        label: 'Days',
        label: "My Second dataset",
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: days_chart_data
      }
    ]
  };
  var ctx = $('#skiDaysGraph').get(0).getContext('2d');
  var graph = new Chart(ctx).Line(data, {});
};

$(document).ready(function() {
  if ($('#touringDaysGraph').length > 0) {
    buildTouringGraph();
  }
  if ($('#skiDaysGraph').length > 0) {
    buildDaysGraph();
  }
});

