// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  var canvas = document.getElementById("drawingPad");
  var context = canvas.getContext("2d");
  var isMouseDown = false;
  var mouseX = 0;
  var mouseY = 0;
  arr = [];
  image = Array.apply(null, Array(784)).map(function () {return 0.0})
  context.strokeStyle = "#000000"; // drawing black lines.
  // make sure the canvas' background is actually white for saving.
  context.fillStyle = "#ffffff";
  context.lineWidth=2;
  context.lineCap = "round"



  context.fillRect(0,0,canvas.width,canvas.height);

  // when the user presses their mouse down on the canvas.
  canvas.addEventListener("mousedown",function (evt) {
      isMouseDown = true;

      mouseX = evt.offsetX;
      mouseY = evt.offsetY;

      context.beginPath();
      context.moveTo(mouseX, mouseY);
  });

  // when the user lifts their mouse up anywhere on the screen.
  window.addEventListener("mouseup",function (evt) {
      isMouseDown = false;

      convertToCSV(arr);
      arr = []
  });

  // as the user moves the mouse around.
  canvas.addEventListener("mousemove",function (evt) {
      if (isMouseDown) {
          mouseX = evt.offsetX;
          mouseY = evt.offsetY;
  				arr.push([(Math.floor(mouseX/10))+Math.floor(mouseY/10)*28])
          context.lineTo(mouseX, mouseY);
          context.lineWidth=10;

          context.stroke();
      }

  });
  function convertToCSV(array){
    for(var pixel in array){
      for(i = 2; i < 3; i++){
        image[array[pixel][0]] =255;
        image[array[pixel][0]+1] = 255-(64*(i-1));
        image[array[pixel][0]-1] = 255-(64*(i-1));
        image[array[pixel][0]+i*28] = 255-(64*(i-1));
        image[array[pixel][0]-i*28] = 255-(64*(i-1));
        image[array[pixel][0]+(i*28-1)] = 255-(64*(i-1));
        image[array[pixel][0]-(i*28-1)] = 255-(64*(i-1));
        image[array[pixel][0]+(i*28+1)] = 255-(64*(i-1));
      	image[array[pixel][0]-(i*28+1)] = 255-(64*(i-1));

    }


      console.log(image)




    }
  }


  // swatch interactivity
  var palette = document.getElementById("palette");
  var swatches = palette.children;
  var currentSwatch; // we'll keep track of what swatch is active in this.

  for (var i = 0; i < swatches.length; i++) {
      var swatch = swatches[i];
      if (i == 0) {
          currentSwatch = swatch;
      }

      // when we click on a swatch...
      swatch.addEventListener("click",function (evt) {

          this.className = "active"; // give the swatch a class of "active", which will trigger the CSS border.
          currentSwatch.className = ""; // remove the "active" class from the previously selected swatch
          currentSwatch = this; // set this to the current swatch so next time we'll take "active" off of this.

          context.strokeStyle = this.style.backgroundColor; // set the background color for the canvas.
      });
  }

  // when the clear button is clicked
  var clearBtn = document.getElementById("clear");
  clearBtn.addEventListener("click",function(evt) {
      canvas.width = canvas.width; // this is all it takes to clear!

      // make sure the canvas' background is actually white for saving.
      context.fillStyle = "#ffffff";
      context.lineCap = "round"

      context.fillRect(0,0,canvas.width,canvas.height);
  });

  // when the save button is clicked
  var saveBtn = document.getElementById("save");
  saveBtn.addEventListener("click",function (evt) {
      // we'll save using the new HTML5 download attribute to save the image.
      // we'll give the image a name of draw-[timestamp].jpg

      //var url = 'data:text/json;charset=utf8,' + encodeURIComponent(image);
      //image = Array.apply(null, Array(784)).map(function () {return 0.0})
      var now = new Date().getTime(); // get today's date in milliseconds.
      var dataUri = canvas.toDataURL("image/jpeg");
      var val = parseInt($('#number_value').val());
      if(isNaN(val)){
        val = -1
      } // get the canvas data as a JPG.
      $.ajax({
         type: "POST",
         url: "/numbers",
         data: { number: { value: val, image_path: dataUri } }
       })
      // change the a href and download attributes so it'll save.
      //this.setAttribute("download","num.jpg");
      //this.setAttribute("href",dataUri);
      //window.open(url, '_blank');
      //window.focus();

      // in older browsers you may need to substitute those last two lines of code with this:
      // window.open(dataUri,"_blank");
  });

  });
