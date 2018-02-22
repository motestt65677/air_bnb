// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load',function(){


  const city_form = document.getElementById("city_form");
  const cities = document.getElementById("cities");
  cities.onchange = function(){
    city_form.submit();
  }


})
