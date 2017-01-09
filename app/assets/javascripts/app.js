$(document).ready(function(){
  new Controller().start();
});

function Controller() {}

Controller.prototype.start = function() {
  View.bindEvent(this.getWeather);
}

Controller.prototype.getWeather = function() {
  event.preventDefault();
  $.ajax({
    url: $(this).attr("href"),
    dataType: "JSON"
  }).done(View.processResponse);
}

var View = {
  bindEvent: function(callback) {
    $("#menu li a").on("click", callback);
  },
  processResponse: function(response) {
    $("#content .panel-body").html(`
      <div>
        <h2>Current Weather</h2>
        <canvas id="currently" width="128" height="128"></canvas>
        <ul>
          <li>${response.currently.summary}</li>
          <li>Temperature: ${response.currently.temperature} F</li>
        </ul>
      </div>
    `);

    var skycons = new Skycons({"color": "grey"});
    skycons.add("currently", response.currently.icon);
  }
};