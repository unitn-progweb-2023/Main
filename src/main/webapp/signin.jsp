<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <h1 class="page-title">Registrazione</h1>

        <form class="max-width-x-small form" action="<%=response.encodeURL("./registraUtente")%>" onsubmit="return valida_form()" method="POST">
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
                <label class="obbligatorio" for="dataNascita">Data di nascita</label>
                <input type="date" id="dataNascita" name="dataNascita">
            </div>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="email">Indirizzo email</label>
                    <input type="email" id="email" name="email" placeholder="example@domain.com">
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="telefono">Numero di telefono</label>
                    <input type="tel" id="telefono" name="telefono" placeholder="3401234789">
                </div>
            </div>

            <div class="radio">
                <label class="obbligatorio">Tipologia utente:</label>
                <div>
                    <input type="radio" id="simpatizzante" name="tipoUtente" value="SI" checked>
                    <label for="simpatizzante">simpatizzante</label>
                </div>

                <div>
                    <input type="radio" id="aderente" name="tipoUtente" value="AD">
                    <label for="aderente">aderente</label>
                </div>
            </div>

            <div class="form-ele-wrapper">
                <label class="obbligatorio" for="username">Username</label>
                <input type="text" id="username" name="username">
            </div>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="password">Password</label>
                    <input type="password" id="password" name="password">
                    <input class="mostra-password" type="checkbox" onclick="mostra_password('password')" id="mostrapassword">
                    <label for="mostrapassword"></label>
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="confermapassword">Conferma Password</label>
                    <input type="password" id="confermapassword" name="confermapassword">
                    <input class="mostra-password" type="checkbox" onclick="mostra_password('confermapassword')" id="mostraconferma">
                    <label for="mostraconferma"></label>
                </div>
            </div>

            <div class="form-row">
                <input class="form-button" type="submit" value="Registrami">
                <input class="form-button" type="reset" value="Cancella tutto">
            </div>
        </form>
        <%@ include file="footer.html"%>
        <%@ include file="cookie.jsp"%>
        <%@ include file="notify-box.html"%>

        <% if(request.getAttribute("error") != null){ %>
            <script>
                // L' attributo 'error' viene settato nella servlet in caso l'username inserito non sia disponibile
                notify(<%= (String) request.getAttribute("error") %>);
            </script>
        <% } %>
        <% request.removeAttribute("error"); %>
    </div>
    <script>
        function valida_nome(){
            let nome = document.getElementById("nome").value;
            return nome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+([a-zA-Z'\s]*[a-zA-Z]+)*$/.test(nome);
        }
        function valida_cognome(){
            let cognome = document.getElementById("cognome").value;
            return cognome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+([a-zA-Z'\s]*[a-zA-Z]+)*$/.test(cognome);
        }
        function valida_eta(){
            let data_attuale = new Date();
            let input = document.getElementById("dataNascita");
            let data_nascita = new Date(input.value);
            /**
             * data_attuale - data_nascita = differenza in millisecondi tra le due date
             * new Date(value) -> crea una data aggiungendo value(in millisecondi) alla data di inizio del timestamp(1 Gennaio 1970)
             */
            let diff = new Date(data_attuale - data_nascita);

            let eta = Math.abs(diff.getUTCFullYear() - 1970);
            return eta >= 18 && eta < data_attuale;
        }
        function valida_mail(){
            let email = document.getElementById("email").value;
            /**
             * il seguente regex controlla che la mail inserita deve:
             *  - avere almeno uno o più caratteri ripetuti compresi tra le prime parentesi quadre
             *  - avere successivamente il carattere '@'
             *  - avere una o più ripetizioni di caratteri presenti nelle seconde parentesi quadre sqguiti sempre da un .
             *  - l'ultima sequenza di caratteri deve comprendere solo lettere e deve avere almeno due caratteri
             */
            return email.length > 0 && /^[-a-zA-Z0-9_.%+]+@(?:[-a-zA-Z0-9]+\.)+[a-zA-Z]{2,}$/.test(email);
        }
        function valida_telefono(){
            let telefono = document.getElementById("telefono").value;
            return telefono.length > 0 && /^[0-9]{10}$/.test(telefono);
        }
        function valida_username(){
            let username = document.getElementById("username").value;
            return username.length > 0;
        }
        function valida_password(){
            let psw = document.getElementById("password").value;
            let confermapsw = document.getElementById("confermapassword").value;
            return psw === confermapsw && /(?=.*[0-9])(?=.*[dD])(?=.*[eE])(?=.*[gG])(?=.*[lL])(?=.*[$!?])(?=.*[A-Z]).{8,}/.test(psw);
        }
        function valida_form(){
            let result = true;
            if(!valida_nome()) {
                notify("Nome non valido: inserire solo spazi, lettere e apostrofi(')");
                result = false;
            }
            if(!valida_cognome()) {
                notify("Cognome non valido: inserire solo spazi, lettere e apostrofi(')");
                result = false;
            }
            if(!valida_eta()) {
                notify("Devi avere più di 18 anni");
                result = false;
            }
            if(!valida_telefono()) {
                notify("Numero di telefono non valido: inserire 10 cifre consecutive");
                result = false;
            }
            if(!valida_mail()) {
                notify("Mail non valida");
                result = false;
            }
            if(!valida_username()) {
                notify("Username obbligatorio")
                result = false;
            }
            if(!valida_password()) {
                notify("Password non valida, la password deve:\n" +
                    " - corrispondere alla seconda password inserita\n" +
                    " - essere lunga almeno 8 caratteri\n" +
                    " - contenere i caratteri 'd', 'e', 'g', 'l'\n" +
                    " - avere almeno un carattere numerico\n" +
                    " - avere almeno un carattere maiuscolo\n" +
                    " - contenere almeno un carattere tra '$' '!' '?'");
                result = false;
            }

            return result;
        }
        function mostra_password(id){
            let psw = document.getElementById(id);
            if(psw.type === "password"){
                psw.type = "text";
            }
            else if(psw.type === "text"){
                psw.type = "password";
            }
        }
    </script>
</body>
</html>
