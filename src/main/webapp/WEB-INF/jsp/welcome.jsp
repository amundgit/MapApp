<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<script>
    //var temp = "<c:out value='${temperature}'/>'";
</script>


<h1>Location Name: ${locationName} C</h1>
<h1>Temperature today: ${temp1} C</h1>
<h1>Temperature tomorrow: ${temp2} C</h1>
<h1>Date today: ${date}</h1>
<h1>URL: ${url}</h1>

<form method="post">
    Enter City: <input type="text" name="city"><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>