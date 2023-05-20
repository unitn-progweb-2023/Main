<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <h1 class="page-title">Contatti</h1>
        <form class="max-width-x-small form" action="invioconfermato.jsp" method="POST">
            <p class="cs-text">Indirizzo: Via Primo Aprile 4, 05000, Trento, Italia<br/>Cellulare: +39 333 1234567 </p>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="nome">Nome</label>
                    <input type="text" id="nome" name="nome" required>
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="cognome">Cognome</label>
                    <input type="text" id="cognome" name="cognome" required>
                </div>
            </div>

            <div class="form-ele-wrapper">
                <label class="obbligatorio" for="email">Indirizzo email</label>
                <input type="email" id="email" name="email" required placeholder="example@domain.com">
            </div>


            <div class="form-row">
                <div class="combo-box">
                    <label class="obbligatorio">Motivo per il quale ci contatti</label>
                    <select name="motivazioni" id="motivazioni" required>
                        <option value="volontario">Diventare volontario</option>
                        <option value="collaborazione">Collaborare con noi</option>
                        <option value="donazione">Fare una donazione</option>
                        <option value="aiuto">Richiesta di cure</option>
                        <option value="altro">Altro</option>
                    </select>
                </div>
                <div class="multi-lines-text">
                    <label>Ulteriori informazioni</label>
                    <textarea rows = "4" cols = "40" name = "ulteriori" placeholder="Scrivi qui ulteriori dettagli..."></textarea>
                </div>
            </div>

            <div class="form-row">
                <input class="form-button" type="submit" value="Contattaci">
                <input class="form-button" type="reset" value="Cancella tutto">
            </div>
        </form>
        <%@ include file="footer.html"%>
    </div>
    <script>
        const x = document.getElementById("contatti");
        x.classList.add("selected")
    </script>
</body>
</html>
