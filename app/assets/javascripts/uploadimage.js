$(document).on('turbolinks:load',function(){
  $("#image_form").submit(function(event){
    event.preventDefault();
    var formData = new FormData();
    var ins = document.getElementById('ajax_images').files.length;
    for (var x = 0; x < ins; x++) {
        formData.append("images[]", document.getElementById('ajax_images').files[x]);
    }


    $.ajax({
      url: this.attributes.action.value,
      data: formData,
      async: false,
      dataType: 'json',
      method: 'POST',
      success: function(data, status, jqXHR) {       
        console.log(data);
        console.log(status);

        $("#carousel_indicator").html("");
        $("#carousel_inner").html("");

        var indicator_string = "";
        for(i=0; i<data.image.length; i++){
          if(i==0){
            indicator_string += `<li data-target='#carouselExampleIndicators' data-slide-to=${i} class='active'></li>`;
            continue;
          }

          indicator_string += `<li data-target='#carouselExampleIndicators' data-slide-to=${i}></li>`;
        }

        var inner_string = "";
        for(i=0; i<data.image.length; i++){
          if(i==0){
            inner_string += `<div class="carousel-item active">
              <img class="d-block w-100" alt="IMAGE" src=${data.image[i].url}>
              </div>`;
            continue;
          }

          inner_string += `<div class="carousel-item">
              <img class="d-block w-100" alt="IMAGE" src=${data.image[i].url}>
              </div>`;
        }

        $("#carousel_indicator").append(indicator_string);
        $("#carousel_inner").append(inner_string);


        // debugger
      },
      cache: false,
      contentType: false,
      processData: false, 
      error: function (jqXHR, status, err) {
        console.log(err);
      }
    })
  }) 
})
