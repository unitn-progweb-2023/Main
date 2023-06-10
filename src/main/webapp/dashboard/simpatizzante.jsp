<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tum4World</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../styles/global.css">
    <link rel="stylesheet" type="text/css" href="../styles/simpatizzante.css">
</head>
<body onload="getAttivitaUtente()">
    <div class="container">
        <%@ include file="navbar.html"%>
        <div class="max-width-small grid">
            <div class="grid-element" >
                <div class="form-contaienr">
                    <form class="form" action="getDati" method="get">
                        <input class="form-button" type="submit" value="Visualizza dati">
                        <input type="hidden" name="page" value="simpatizzante">
                    </form>

                    <div class="info-text">
                        <p id="nome">Nome: ${account.getNome()}</p>
                        <p id="cognome">Cognome: ${account.getCognome()}</p>
                        <p id="email">Email: ${account.getEmail()}</p>
                        <p id="cellulare">Cellulare: ${account.getCellulare()}</p>
                        <p id="dataDiNascita">Data di nascita: ${account.getDataDiNascita()}</p>
                        <p id="username">Username: ${account.getUsername()}</p>
                    </div>
                </div>
            </div>
            <div class="span-2 grid-element">
                <div class="form-contaienr">
                    <form class="form" id="formIscrizione">
                        <h1>Iscriviti alle seguenti attività</h1>

                        <div class="checkbox">
                            <label for="at1">
                                <img src="../img/chisiamo_1.jpg">
                            </label>
                            <input type="checkbox" id="at1" name="attivita" value="at1">
                            <h1>Fornitura di cure mediche</h1>
                        </div>
                        <div class="checkbox">
                            <label for="at2">
                                <img src="../img/chisiamo_2.jpg">
                            </label>
                            <input type="checkbox" id="at2" name="attivita" value="at2">
                            <h1>Programmi di educazione sanitaria</h1>
                        </div>
                        <div class="checkbox">
                            <label for="at3">
                                <img src="../img/chisiamo_3.jpg">
                            </label>
                            <input type="checkbox" id="at3" name="attivita" value="at3">
                            <h1>Progetti di sviluppo comunitario</h1>
                        </div>
                        <input class="form-button" type="submit" value="Iscriviti">
                    </form>
                </div>
            </div>
            <div class="grid-element">
                <div class="form-contaienr">
                    <form class="form" action="./deleteAccount" method="post">
                        <input class="form-button red" type="submit" value="Disiscrivimi">
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
    <script>
        function getAttivitaUtente() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    for(let i = 0; i < response.length; i++){
                        document.getElementById(response[i]).checked = true;
                    }
                }
            };
            xhttp.open("GET", "setAttivita", true);
            xhttp.send();
        }
        document.getElementById("formIscrizione").addEventListener("submit", (event) => {
            event.preventDefault(); // Prevent default form submission behavior

            let attivita = document.getElementsByName("attivita");
            let aggiungi = [];
            let rimuovi = [];

            attivita.forEach((att) => {
                if(att.checked) {
                    aggiungi.push(att.id);
                }
                else
                    rimuovi.push(att.id);
            });

            var encodedAggiungi = aggiungi.map(function(att) {
                return "aggiungi=" + encodeURIComponent(att);
            }).join("&");
            var encodedRimuovi = rimuovi.map(function(att) {
                return "rimuovi=" + encodeURIComponent(att);
            }).join("&");
            var encodedData = encodedAggiungi + "&" + encodedRimuovi;

            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", "setAttivita", true);
            // xhttp.setRequestHeader("Content-Type", "multipart/form-data");
            xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhttp.send(encodedData);
        });
    </script>
</body>
</html>
