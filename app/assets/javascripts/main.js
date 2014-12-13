$( document ).ready(function() {
  $("#navbar-search-input").on('input', function() {
    if($.trim( $('#navbar-search-input').val() ) !== '' ) {
      $("#navbar-search-options").hide();
      $("#navbar-search-cancel").show();
    } else {
      $("#navbar-search-options").show();
      $("#navbar-search-cancel").hide();
    }
  });

  $("#navbar-search-cancel").on("click", function(e) {
    $("#navbar-search-input").val('');
    $("#navbar-search-cancel").hide();
    $("#navbar-search-options").show();
    e.stopPropagation();
  });
});
