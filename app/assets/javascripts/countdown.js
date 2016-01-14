$(document).ready(function(){
  $("[data-countdown]").each(function() {
    var $this = $(this), finalDate = $(this).data("countdown");
    $this.countdown(finalDate, function(event) {
      $this.html(event.strftime("%H:%M:%S"));
    });
    $this.on("finish.countdown", function(event){
      $(this).closest(".entry")
        .css(".bg-danger")
      $(this).parent()
        .html("Closed!")
    });
  });
})
