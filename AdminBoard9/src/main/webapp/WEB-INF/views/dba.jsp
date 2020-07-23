<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
Dear <strong>${user}</strong>, Welcome to DBA Page.
    <a href="<c:url value="/logout" />">Logout</a>
</body>
</html>
