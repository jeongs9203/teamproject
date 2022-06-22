$(function() {
   $("#btn").on("click", function() {
      if ($("#id").val() == "") {
         $("#id").next("label").addClass("warning");
         setTimeout(function() {
            $("label").removeClass("warning");
         }, 800);
      }
      else if ($("#passwd").val() == "") {
         $("#passwd").next("label").addClass("warning");
         setTimeout(function() {
            $("label").removeClass("warning");
         }, 800);
      }
   });
});