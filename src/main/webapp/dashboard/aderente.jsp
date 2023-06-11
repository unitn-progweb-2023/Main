<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tum4World</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../styles/global.css">
    <link rel="stylesheet" type="text/css" href="../styles/aderente.css">
</head>
<body onload="getAttivitaUtente()">
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <div class="max-width-small grid">
            <div class="grid-element" >
                <div class="form-contaienr">
                    <form class="form" id="datiUtente">
                        <input class="form-button" type="submit" value="Visualizza dati">
                    </form>

                    <div class="info-text">
                        <p id="nome">Nome: </p>
                        <p id="cognome">Cognome: </p>
                        <p id="email">Email: </p>
                        <p id="cellulare">Cellulare: </p>
                        <p id="dataDiNascita">Data di nascita: </p>
                        <p id="username">Username: </p>
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
                    <form class="form" action="<%=response.encodeURL("./deleteAccount")%>" method="post">
                        <input class="form-button red" type="submit" value="Disiscrivimi">
                    </form>
                </div>
            </div>
            <div class="grid-element column-span-2">
                <div class="form-contaienr dona">
                    <h1>Effettua una donazione a Tum4World</h1>
                    <form class="form dona" action="<%=response.encodeURL("./donazioni")%>" method="post">
                        <label class="obbligatorio" for="dona" >Importo in €</label>
                        <input id="dona" type="number" min="0" name="importo">
                        <input type="submit" value="Dona">
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
    <script>
        document.getElementById("datiUtente").addEventListener("submit", (event) => {
            event.preventDefault();

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    document.getElementById("nome").innerText = "Nome: " + response.Nome;
                    document.getElementById("cognome").innerText = "Cogome: " + response.Cognome;
                    document.getElementById("email").innerText = "Email: " + response.Email;
                    document.getElementById("cellulare").innerText = "Cellulare: " + response.Cellulare;
                    document.getElementById("dataDiNascita").innerText = "Data di nascita: " + response.DataDiNascita;
                    document.getElementById("username").innerText = "Username: " + response.Username;
                }
            };
            xhttp.open("GET","<%=response.encodeURL("getDati?page=aderente")%>", true);
            xhttp.send();
        });
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
            xhttp.open("GET", "<%=response.encodeURL("setAttivita")%>", true);
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
            xhttp.open("POST", "<%=response.encodeURL("setAttivita")%>", true);
            xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhttp.send(encodedData);
        });
    </script>
</body>
</html>
