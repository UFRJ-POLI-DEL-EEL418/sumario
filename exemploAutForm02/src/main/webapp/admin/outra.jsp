<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>exemploAutForm02</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="<%=
                new URL(request.getScheme(), 
                request.getServerName(), 
                request.getServerPort(), 
                request.getContextPath())%>/css/exampleFormAuth.css" type="text/css"/>
    </head>

    <body>
        <div id="idDiv1">
            <h1>Catalogação</h1>
            <br>
            <br>
            <a href="https://localhost:8443/exemploAutForm01/admin/index.jsp">Busca</a>
            <br>
            <br>
            <form method="POST" action="http://localhost:8084/exemploAutForm01/logout">
                <input type="submit" value="LOGOUT"/>
            </form>
        </div>
    </body>
</html>
