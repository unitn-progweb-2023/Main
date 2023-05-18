<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tum4World</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../styles/simpatizzante.css">
    <link rel="stylesheet" type="text/css" href="../styles/global.css">
</head>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <div class="max-width-small grid">
            <div class="grid-element" >
                <div class="form-contaienr">
                    <form class="form" action="/dashboard/getdati" method="get">
                        <input class="form-button" type="submit" value="Visualizza dati">
                    </form>
                    ${account.getNome()}
                    ${account.getCognome()}
                    ${account.getEmail()}
                    ${account.getCellulare()}
                    ${account.getDataDiNascita()}
                    ${account.getUsername()}
                </div>
            </div>
            <div class="span-2 grid-element"> b </div>
            <div class="grid-element"> c </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
