    function initMap(latlng) {
      var map = new google.maps.Map(document.getElementById('map'), {
        center: latlng,
        zoom: 16
      });

      var marker = new google.maps.Marker({
        position: latlng,
        map: map
      });
    }

    function getLatLng() {
      var geocoder = new google.maps.Geocoder();

      geocoder.geocode({
        address: "<%= user.prefecture_name %><%= user.address_city %><%= user.address_street %>"
      }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          for (var i in results) {
            if (results[i].geometry) {
              var latlng = results[i].geometry.location;
              initMap(latlng)
            }
          }
        }
      });
    }
