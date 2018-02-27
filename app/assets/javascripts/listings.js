// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load',function(){


  const city_form = document.getElementById("city_form");
  const city = document.getElementById("city");
  

  const date_form = document.getElementById("date_form");
  const date = document.getElementById("date");
  flatpickr(date, {mode: "range", minDate: "today"});

})
