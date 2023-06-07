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
        <div class="max-width-small page-container">
            <div class="menu">
                <button onclick="select(event,getUtenti)">Utenti registrati</button>
                <button onclick="select(event,getSimpatizzanti)">Utenti simpatizzanti</button>
                <button onclick="select(event,getAderenti)">Utenti aderenti</button>
                <button onclick="select(event,()=>{})">Statistiche visite</button>
                <button onclick="select(event,()=>{})">Donazioni ricevute</button>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
    <script>
        function select(e, func) {
            var menuDiv = document.querySelector('.menu');
            var buttons = menuDiv.getElementsByTagName('button');

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('selected');
            }

            e.target.classList.add("selected");

            func();
        }
        function getUtenti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.response);
                    var response = JSON.parse(this.response);
                    //da aggiungere alle tabelle
                }
            };
            xhttp.open("GET", "utentiRegistrati", true);
            xhttp.send();
        }
        function getAderenti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.response);
                    var response = JSON.parse(this.response);
                    //da aggiungere alle tabelle
                }
            };
            xhttp.open("GET", "utentiAderenti", true);
            xhttp.send();
        }
        function getSimpatizzanti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    console.log(this.response);
                    var response = JSON.parse(this.response);
                    //da aggiungere alle tabelle
                }
            };
            xhttp.open("GET", "utentiSimpatizzanti", true);
            xhttp.send();
        }
    </script>
</body>
</html>
