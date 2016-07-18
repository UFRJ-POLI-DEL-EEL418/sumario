<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/exampleFormAuth.css" type="text/css"/>
    </head>

    <body style="background-color:lightgray;">
        <div id="idDiv1" style="text-align:center;width:600px;
     height:400px;
     background-color:white;
     margin-left:auto;
     margin-right:auto;
     border:1px solid black;
     padding:20px;">
            <h1>Busca</h1>
            <br>
            <br>
            <a href="https://localhost:8443/exemploAutForm01/admin/outra.jsp">Catalogação</a>
            <br>
            <br>
            <form method="POST" action="http://localhost:8084/exemploAutForm01/logout">
                <input type="submit" value="LOGOUT"/>
            </form>
        </div>
    </body>
</html>
