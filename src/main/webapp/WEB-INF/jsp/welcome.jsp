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
        var longitude = "<c:out value='${longitude}'/>'";
        var latitude = "<c:out value='${latitude}'/>'";
        var iconId = "<c:out value='${iconId}'/>'";
    </script>
</head>

<body>

<script>
    console.log("Longitudes:")
    console.log(longitude)
    console.log("Latitude:")
    console.log(latitude)
    console.log("Icon:")
    console.log(iconId)
</script>

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
                <input class="form-control mr-sm-2" type="text" size="6"  placeholder="Enter City" name="city" aria-label="Search">
                <button class="btn btn-secondary my-2 my-sm-0" value="Submit" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
            </form>

        </div>



    </div>
</nav>

<!-- Giffy / Slider -->
<div class="jumbotron-wrap jumbotron-wrap-image mb-0">
    <div class="container">
        <div id="mainCarousel" class="carousel slide" data-ride="carousel">

            <div class="jumbotron">
                <h1 class="text-center">Welcome to WeatherForecast for Norway!</h1>

            </div>


            <div class="carousel-item">
                <div class="jumbotron">

                </div>
            </div>



        </div>
    </div>
</div>

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
                                zoom: 16,
                                center: new google.maps.LatLng(-33.91722, 151.23064),
                                mapTypeId: 'roadmap'
                            });

                            var iconBase = 'https://api.met.no/weatherapi/weathericon/1.1/available/';
                            var icons = {
                                parking: {
                                    icon: iconBase + '1'
                                },
                                library: {
                                    icon: iconBase + 'library_maps.png'
                                },
                                info: {
                                    icon: iconBase + 'info-i_maps.png'
                                }
                            };

                            var features = [
                                {
                                    position: new google.maps.LatLng(-33.91721, 151.22630),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(60.410270, 5.326397),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91747, 151.22912),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91910, 151.22907),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91725, 151.23011),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91872, 151.23089),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91784, 151.23094),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91682, 151.23149),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91790, 151.23463),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91666, 151.23468),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.916988, 151.233640),
                                    type: 'info'
                                }, {
                                    position: new google.maps.LatLng(-33.91662347903106, 151.22879464019775),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.916365282092855, 151.22937399734496),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.91665018901448, 151.2282474695587),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.919543720969806, 151.23112279762267),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.91608037421864, 151.23288232673644),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.91851096391805, 151.2344058214569),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.91818154739766, 151.2346203981781),
                                    type: 'parking'
                                }, {
                                    position: new google.maps.LatLng(-33.91727341958453, 151.23348314155578),
                                    type: 'library'
                                }
                            ];

                            // Create markers.
                            features.forEach(function(feature) {
                                var marker = new google.maps.Marker({
                                    position: feature.position,
                                    icon: icons[feature.type].icon,
                                    map: map
                                });
                            });
                        }
                    </script>

                </div>
                <a class="btn btn-secondary btn-lg text-align=center"  href="#" role="button"><i class="fa fa-info"></i> &nbsp; Today</a>
                <a class="btn btn-primary btn-lg" href="#" role="button"><i class="fa fa-info"></i> &nbsp; Tomorrow</a>
            </div>
        </div>

        <div class=" row">
            <div class="card-body ">
                <div class="col-md-4">
                    <div class="col-md-4">
                        <h1>Location: ${locationName}</h1>
                        <h1>Temperature: ${temperature} C</h1>
                        <h1>Time: ${time}</h1>
                        <h1>Rain: ${rain} [mm]</h1>
                        <form method="post">
                            Enter City: <input type="text" name="city"><br>
                            <input type="submit" value="Submit">
                        </form>
                        <div class="col-md-4">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<h1>Location Name: ${locationName} </h1>
<h2>Longitude: ${lon}</h2>
<h2>Latitude: ${lat}</h2>
<h1>Temperature today: ${temp1} C</h1>
<h1>Symbol Id today: ${symbolId1} </h1>
<h1>Temperature tomorrow: ${temp2} C</h1>
<h1>Symbol Id tomorrow: ${symbolId2} </h1>
<h1>Date today: ${date}</h1>
<h1>URL: ${url}</h1>

<form method="post">
    <input type="text" placeholder="Enter City" name="city"><br>
    <input type="submit" value="Submit">
</form>
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
            <p class="text-center">Copyright 2018 by: Lasse, Arne, Rudi & Amund | Fullstack JavaCourse <br>
                Experis Academy
                </br>.</p>
            <p class="text-center"><a href="#">Back to top</a></p>
        </div>

</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0W444WHTjBo2y4-LNwVtcv-FZvpiI0Vw&callback=initMap"
        async defer></script>

</body>
</html>