$(document).on "turbolinks:load",  ->
  $(".datepicker").datepicker
    dateFormat: "dd-mm-yy",
    changeYear: true,
