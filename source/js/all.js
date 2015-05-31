document.addEventListener("DOMContentLoaded", function(event) { 
  var container = document.querySelector('#container');
  var msnry;
  // initialize Masonry after all images have loaded
  imagesLoaded(container, function() {
    msnry = new Packery(container, {});
  });
});
