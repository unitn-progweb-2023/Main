<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tum4World</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../styles/global.css">
    <link rel="stylesheet" type="text/css" href="../styles/amministratore.css">
</head>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
            <div class="max-width-small grid">
                <div class="grid-element" >
                    <div class="form-contaienr">
                        <form action="/dashboard/utentiRegistrati" method="get">
                            <input type="submit" value="Utenti registrati">
                        </form>
                    </div>
                    <div class="form-contaienr">
                        <form action="/dashboard/utentiSimpatizzanti" method="get">
                            <input type="submit" value="Utenti simpatizzanti">
                        </form>
                    </div>
                    <div class="form-contaienr">
                        <form action="/dashboard/utentiAderenti" method="get">
                            <input type="submit" value="Utenti aderenti">
                        </form>
                    </div>
                    <div class="form-contaienr">
                        <form action="/dashboard/visite" method="get">
                            <input type="submit" value="Statistiche visite">
                        </form>
                    </div>
                    <div class="form-contaienr">
                        <form action="/dashboard/donazioni" method="get">
                            <input type="submit" value="Donazioni ricevute">
                        </form>
                    </div>
                </div>
            </div>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
