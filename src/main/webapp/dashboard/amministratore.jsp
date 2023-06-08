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
                <button onclick="select(event,getUtenti,'registrati')">Utenti registrati</button>
                <button onclick="select(event,getSimpatizzanti,'simpatizzanti')">Utenti simpatizzanti</button>
                <button onclick="select(event,getAderenti,'aderenti')">Utenti aderenti</button>
                <button onclick="select(event,getVisite,'visite')">Statistiche visite</button>
                <button onclick="select(event,getDonazioni,'donazioni')">Donazioni ricevute</button>
            </div>
            <div class="content">
                <div id="default" class="show content-default">
                    Seleziona una voce del menu!
                </div>

                <div id="registrati" class="content-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Cognome</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Cellulare</th>
                            <th>Data di nascita</th>
                        </tr>
                        </thead>
                        <tbody id="registrati-table">
                        </tbody>
                    </table>
                </div>
                <div id="simpatizzanti" class="content-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Cognome</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Cellulare</th>
                            <th>Data di nascita</th>
                        </tr>
                        </thead>
                        <tbody id="simpatizzanti-table" >
                        </tbody>
                    </table>
                </div>
                <div id="aderenti" class="content-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Cognome</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Cellulare</th>
                            <th>Data di nascita</th>
                        </tr>
                        </thead>
                        <tbody id="aderenti-table">
                        </tbody>
                    </table>
                </div>
                <div id="visite" class="content-visite">
                    <div>Visite totali: 123</div>
                    <button onclick="azzeraVisite()">Azzera Visite</button>
                    <div id="chart" class="span-2"></div>
                </div>
                <div id="donazioni" class="content-default"></div>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script>
        let page = "default";

        function azzeraVisite(){
            console.log("azzera");
        }

        function riempiTabella(id,data){
            const table = document.getElementById(id);
            for (let i = table.rows.length; i > 0; i--) {
                table.deleteRow(i);
            }
            data.forEach(function(user) {
                const row = table.insertRow();

                row.insertCell().textContent = user.Nome;
                row.insertCell().textContent = user.Cognome;
                row.insertCell().textContent = user.Username;
                row.insertCell().textContent = user.Email;
                row.insertCell().textContent = user.Cellulare;
                row.insertCell().textContent = user.DataDiNascita;

            });
        }

        function select(e, func, selectedPage) {
            const menuDiv = document.querySelector('.menu');
            const buttons = menuDiv.getElementsByTagName('button');
            for (let i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('selected');
            }

            const oldElement = document.getElementById(page);
            oldElement.classList.remove("show");

            const newElement = document.getElementById(selectedPage);
            newElement.classList.add("show");

            page = selectedPage;

            e.target.classList.add("selected");

            func();
        }
        function getUtenti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    riempiTabella("registrati-table", response);
                }
            };
            xhttp.open("GET", "utentiRegistrati", true);
            xhttp.send();
        }
        function getAderenti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    riempiTabella("aderenti-table", response);
                }
            };
            xhttp.open("GET", "utentiAderenti", true);
            xhttp.send();
        }
        function getSimpatizzanti() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    riempiTabella("simpatizzanti-table", response);
                }
            };
            xhttp.open("GET", "utentiSimpatizzanti", true);
            xhttp.send();
        }
        function getVisite() {
            /*var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);*/

                    let response = [1,20,234,34,12,54,0,0,0,0,0,0];
                    console.log(this.response);

                    const chart = Highcharts.chart('chart', {
                        chart: {
                            type: 'column',
                            backgroundColor: "#ecfeff"
                        },
                        title: {
                            text: 'Visite per pagina'
                        },
                        xAxis: {
                            categories: ["Gennaio", "Febbraio", "Marzo", "Aprile", "Maggio", "Giugno", "Luglio", "Agosto", "Settembre", "Ottobre", "Novembre", "Dicembre"]
                        },
                        yAxis: {
                            title: {
                                text: 'Numero Visite'
                            }
                        },
                        series: [{
                            name:"",
                            data: response,
                            showInLegend: false
                        }],
                    });
                /*}
            };
            xhttp.open("GET", "visite", true);
            xhttp.send();*/
        }
        function getDonazioni() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = JSON.parse(this.response);

                    // let response = [1,20,234,34,12,54,0,0,0,0,0,0];
                    // console.log(this.response);

                    const chart = Highcharts.chart('donazioni', {
                        chart: {
                            type: 'column',
                            backgroundColor: "#ecfeff"
                        },
                        title: {
                            text: 'Totale donazioni per mese'
                        },
                        xAxis: {
                            categories: ["Gennaio", "Febbraio", "Marzo", "Aprile", "Maggio", "Giugno", "Luglio", "Agosto", "Settembre", "Ottobre", "Novembre", "Dicembre"]
                        },
                        yAxis: {
                            title: {
                                text: 'Totale donazioni'
                            },
                            labels: {
                                formatter: function() {
                                    return this.value + ' €';
                                }
                            },
                        },
                        series: [{
                            name:"",
                            data: response,
                            showInLegend: false
                        }],
                    });
                }
            };
            xhttp.open("GET", "getDonazioni", true);
            xhttp.send();
        }
    </script>
</body>
</html>
