<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <title>Weather Forecast Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>

    <script>
        var longitude = "<c:out  value='${longitude}'/>";
        var jsonLongitude = JSON.parse(longitude.toString());
        var latitude = "<c:out value='${latitude}'/>";
        var jsonLatitude = JSON.parse(latitude.toString());
        var iconId = "<c:out value='${iconId}'/>";
        var jsonIconId = JSON.parse(iconId.toString());
        var iconIdTomorrow = "<c:out value='${iconIdTomorrow}'/>";
        var jsonIconIdTomorrow = JSON.parse(iconIdTomorrow.toString());
    </script>
</head>

<body>


<bodyid="home" data-spy="scroll" data-target="#navbar-top" data-offset="200">

<!-- Main navigation -->
<nav id="navbar-top" class="navbar fixed-top navbar-expand-md navbar-dark">
    <div class="container">

        <!-- Company name shown on mobile -->
        <a class="navbar-brand" href="#"><span>Weather</span>Forecast</a>

        <!-- Mobile menu toggle -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Main navigation items -->
        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav mr-auto">
                <li data-toggle="collapse" data-target=".navbar-collapse.show" class="nav-item">
                    <a class="nav-link" href="#home">Home</a>
                </li>

            </ul>

            <form class="form-inline header-search-form my-2 my-lg-0" method="post">
                <input class="form-control mr-sm-2" type="text" size="0"  placeholder="Enter City" name="city" aria-label="Search">
                <button class="btn btn-secondary my-2 my-sm-0" value="Submit" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
            </form>

        </div>



    </div>
</nav>

<section id="weclome" class="card-container">
    <div class="container">

        <div class="text-center padded-box pb-0">
            <h2>Look up WeatherForecast for your city</h2>

        </div>


        <div class=" row">

            <div class="col-md-12">
                <div class="card-body ">
                    <div id="map"></div>
                    <script>
                        var map;
                        function initMap() {
                            map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 5,
                                center: new google.maps.LatLng(64.42098, 16.0345166),
                                mapTypeId: 'roadmap'
                            });

                            var iconBasePrefix = 'https://api.met.no/weatherapi/weathericon/1.1/?symbol=';
                            var iconBaseSuffix = '&content_type=image/png';


                            for(var i in jsonLatitude){
                                var marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(jsonLatitude[i], jsonLongitude[i]),
                                    icon: iconBasePrefix + jsonIconId[i] + iconBaseSuffix,
                                    map: map
                                })
                            }

                        }
                    </script>


                    <a class="btn btn-secondary btn-lg"  data-toggle="modal" data-target="#myModalToday" role="button"><i class="fa fa-info"></i> &nbsp; Today</a>
                    <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalTomorrow" role="button"><i class="fa fa-info"></i> &nbsp; Tomorrow</a>
                </div></div>
        </div>
        <div id="myModalToday" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Weather Forecast</h4>
                    </div>
                    <div class="modal-body">

                        <h3><div class="hiddentext" style="display: none;">Location Name:</div> ${locationName} </h3>
                        <h3>Temperature today: ${temp1} C</h3>
                        <h3>Date today: ${date}</h3>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <div id="myModalTomorrow" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Weather Forecast</h4>
                    </div>
                    <div class="modal-body">

                        <h3><div class="hiddentext" style="display: none;">Location Name:</div> ${locationName} </h3>

                        <h3>Temperature tomorrow: ${temp2} C</h3>
                        <h3>Date today: ${date}</h3>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

</section>


<!-- Footer -->
<footer class="footer">
    <div class="footer-lists">
        <div class="container">
            <div class="row">
                <div class="col-sm">

                </div>
                <div class="col-sm">

                </div>
                <div class="col-sm">

                </div>
                <div class="col-sm">

                </div>
            </div>
        </div>


        <div class="footer-bottom">
            <h3 class="text-center">  Lasse, Arne, Rudi & Amund  <br>
                Fullstack JavaCourse <br>
                Experis Academy <br>
                Copyright @ <script data-turbolinks-eval="false" type="text/javascript"> document.write(new Date().getFullYear());</script>
                </br>.</h3>
            <h2 class="text-center"><a href="#">Back to top</a></h2>
        </div>

</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfLlCoBPijskJ330ZgsQaePB0RKPke_a8&callback=initMap"
        async defer></script>
<script>
    // Get the modal
    var modal = document.getElementById('myModal');
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    }</script>


</body>
</html>