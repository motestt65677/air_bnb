$(document).on('turbolinks:load',function(){


  const city_form = document.getElementById("city_form");
  const city = document.getElementById("city");
  

  const date_form = document.getElementById("date_form");
  const date = document.getElementById("date");
  flatpickr(date, {mode: "range", minDate: "today"});

})
