$(document).ready(function() {
  $('#search').on('click', searchFlickr);
  $('#clear').on('click', clearPhotos);
  $(window).on('scroll', loader);
});
var requestInProgress = false;

var searchFlickr = function() {
  clearPhotos();
  requestInProgress = true;
  var query = $('#query').val();
  console.log('query' + query);
  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?'
  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: '2f5ac274ecfac5a455f38745704ad084',
    text: query,
    format: 'json'
  }, processImages);
  console.log(flickrUrl);
}

var processImages = function(result) {
  requestInProgress = false;
  console.log(result);
  var photos = result.photos.photo;
  if (result.stat != 'ok') {
    return;
  }
  $.each(photos, function(i, pic) {
    var url = 'https://farm' + pic.farm + '.staticflickr.com/' + pic.server + '/' + pic.id + '_' + pic.secret + '.jpg';
    console.log(url);
    var title = pic.title;
    var alt = " title='" + title + "'"
    var source = "<div class='image'><img src=" + url + alt + "></div>";
    $('#images').append(source);
  })
};

var clearPhotos = function() {
  $('#images').empty();
}

var loader = function() {
  if (requestInProgress == true) {
    console.log(requestInProgress);
    return;
  };
  var scrollTop = $(window).scrollTop();
  var docHeight = $(document).height();
  var windowHeight = $(window).height();
  console.log(scrollTop + " " + docHeight + " " + windowHeight);
  if (scrollTop > docHeight - (2 * windowHeight)) {
    console.log('scrolly!')
    searchFlickr;
  }
};