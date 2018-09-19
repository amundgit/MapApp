<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<script>
    var temp = "<c:out value='${temperature}'/>'";
</script>


<h1>Location: ${locationName}</h1>
<h1>Temperature: ${temperature} C</h1>
<h1>Time: ${time}</h1>
<h1>Rain: ${rain} [mm]</h1>
<form method="post">
    Enter City: <input type="text" name="city"><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>