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
                        <input type="submit" value="Utenti registrati" onclick="getUtenti()">
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
    <script>
        function getUtenti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.response);
                    var response = JSON.parse(this.response);
                    document.getElementById("footer-frase").innerHTML = response;
                }
            };
            xhttp.open("GET", "utentiRegistrati", true);
            xhttp.send();
        }
    </script>
</body>
</html>
