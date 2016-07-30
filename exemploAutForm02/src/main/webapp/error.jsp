<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>exemploAutForm02</title>
        <link rel="stylesheet" 
              href="<%=
                new URL(request.getScheme(), 
                request.getServerName(), 
                request.getServerPort(), 
                request.getContextPath())%>/css/exampleFormAuth.css" type="text/css"/>
    </head>
    
    <body>
        <div id="idDiv1">
            <br>
            <br>    
            <h2>Login page</h2>
            <br>                                             
            <form method="POST" action="j_security_check">
                <table border="0" cellspacing="5" style="margin-left:auto;margin-right:auto;">
                    <tr>
                        <th align="right">Username:</th>
                        <td align="left"><input type="text" name="j_username" disabled></td>
                    </tr>
                    <tr>
                        <th align="right">Password:</th>
                        <td align="left"><input type="password" name="j_password" disabled></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <br>
                            <input type="submit" value="LOGIN" disabled style="width:100px;">
                            <input type="reset" value="RESET" disabled style="width:100px;">
                        </td>
                    </tr>
                </table>
                <div style="color:black;background-color:pink; ">
                    <h3>Erro 401 unauthorized</h3>
                    <h3>
                        Usuário ou senha inválidos,
                        <br>
                        tente de novo <a href="/exemploAutForm01/admin/index.jsp">aqui</a>.
                    </h3>
                </div>
                <div style="color:black;">
                    <h4>(Port padrão do HTTPS:     443)</h4>
                    <h4>(Port do HTTPS do Tomcat: 8443)</h4>
                </div>
            </form>
        </div>
    </body>
</html>
