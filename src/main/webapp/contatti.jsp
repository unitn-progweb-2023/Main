<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <h1 class="page-title">Contatti</h1>
        <form class="max-width-x-small form" action="<%= response.encodeURL("sendEmail") %>" onsubmit="return valida_form()" method="POST">
            <p class="cs-text">Indirizzo: Via Primo Aprile 4, 05000, Trento, Italia<br/>Cellulare: +39 333 1234567 </p>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="nome">Nome</label>
                    <input type="text" id="nome" name="nome">
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="cognome">Cognome</label>
                    <input type="text" id="cognome" name="cognome">
                </div>
            </div>

            <div class="form-ele-wrapper">
                <label class="obbligatorio" for="email">Indirizzo email</label>
                <input type="email" id="email" name="email" placeholder="example@domain.com">
            </div>


            <div class="form-row">
                <div class="combo-box">
                    <label class="obbligatorio" for="motivazioni">Motivo per il quale ci contatti</label>
                    <select name="motivazioni" id="motivazioni" required>
                        <option value="volontario">Diventare volontario</option>
                        <option value="collaborazione">Collaborare con noi</option>
                        <option value="donazione">Fare una donazione</option>
                        <option value="aiuto">Richiesta di cure</option>
                        <option value="altro">Altro</option>
                    </select>
                </div>
                <div class="multi-lines-text">
                    <label for = "ulteriori">Ulteriori informazioni</label>
                    <textarea id = "ulteriori" rows = "4" cols = "40" name = "ulteriori" placeholder="Scrivi qui ulteriori dettagli..."></textarea>
                </div>
            </div>

            <div class="form-row">
                <input class="form-button" type="submit" value="Contattaci">
                <input class="form-button" type="reset" value="Cancella tutto">
            </div>
        </form>
        <%@ include file="footer.html"%>
        <%@ include file="cookie.jsp"%>
        <%@ include file="notify-box.html"%>
    </div>
    <script>
        const x = document.getElementById("contatti");
        x.classList.add("selected");

        function valida_nome(){
            let nome = document.getElementById("nome").value;
            return nome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+([a-zA-Z'\s]*[a-zA-Z]+)*$/.test(nome);
        }
        function valida_cognome(){
            let cognome = document.getElementById("cognome").value;
            return cognome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+([a-zA-Z'\s]*[a-zA-Z]+)*$/.test(cognome);
        }
        function valida_mail(){
            let email = document.getElementById("email").value;
            return email.length > 0 && /^[-a-zA-Z0-9_.%+]+@(?:[-a-zA-Z0-9]+\.)+[a-zA-Z]{2,}$/.test(email);
        }
        function valida_form(){
            if(!valida_nome()) {
                notify("Nome non valido: inserire solo spazi, lettere e '");
                return false;
            }
            if(!valida_cognome()) {
                notify("Cognome non valido: inserire solo spazi, lettere e '");
                return false;
            }
            if(!valida_mail()) {
                notify("Mail non valida");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
