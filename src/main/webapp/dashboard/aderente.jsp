<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tum4World</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../styles/global.css">
    <link rel="stylesheet" type="text/css" href="../styles/aderente.css">
</head>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <div class="max-width-small grid">
            <div class="grid-element" >
                <div class="form-contaienr">
                    <form class="form" action="/dashboard/getDati" method="get">
                        <input class="form-button" type="submit" value="Visualizza dati">
                        <input type="hidden" name="page" value="aderente">
                    </form>

                    <div class="info-text">
                        <p>Nome: ${account.getNome()}</p>
                        <p>Cognome: ${account.getCognome()}</p>
                        <p>Email: ${account.getEmail()}</p>
                        <p>Cellulare: ${account.getCellulare()}</p>
                        <p>Data di nascita: ${account.getDataDiNascita()}</p>
                        <p>Username: ${account.getUsername()}</p>
                    </div>
                </div>
            </div>
            <div class="span-2 grid-element">
                <div class="form-contaienr">
                    <form class="form" action="/dashboard/setAttivita" method="post">
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
                        <input type="hidden" name="page" value="aderente">
                    </form>
                </div>
            </div>
            <div class="grid-element">
                <div class="form-contaienr">
                    <form class="form" action="/dashboard/deleteAccount" method="post">
                        <input class="form-button red" type="submit" value="Disiscrivimi">
                    </form>
                </div>
            </div>
            <div class="grid-element column-span-2">
                <div class="form-contaienr dona">
                    <h1>Effettua una donazione a Tum4World</h1>
                    <form class="form dona" action="./donazioni" method="get">
                        <label class="obbligatorio" for="dona" >Importo in €</label>
                        <input id="dona" type="number" min="0" value="importo">
                        <input type="submit" value="Dona">
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
