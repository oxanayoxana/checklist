$(document).ready( function() {
  $("#new").find(".modal-content").html("<%= escape_javascript(render 'form') %>");
  $("#new").modal('show');
});