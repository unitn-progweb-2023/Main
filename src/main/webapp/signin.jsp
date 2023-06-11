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
                notify(<%= (String) request.getAttribute("error") %>);
            </script>
        <% } %>
        <% request.removeAttribute("error"); %>
    </div>
    <script>
        function valida_nome(){
            let nome = document.getElementById("nome").value;
            return nome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+[a-zA-Z'\s]*[a-zA-Z]+$/.test(nome);
        }
        function valida_cognome(){
            let cognome = document.getElementById("cognome").value;
            return cognome.length > 0 && /^(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')[a-zA-Z]+[a-zA-Z'\s]*[a-zA-Z]+$/.test(cognome);
        }
        function valida_eta(){
            let ora = new Date();
            let input = document.getElementById("dataNascita");
            let data_nascita = new Date(input.value);
            let diff = new Date(ora - data_nascita);
            let eta = Math.abs(diff.getUTCFullYear() - 1970);
            return eta >= 18 && eta < ora;
            /*try {
                return new Date(new Date() - new Date(document.getElementById("data_nascita").value)).getUTCFullYear()>1970;
            } catch (e) {
                return false;
            }*/
        }
        function valida_mail(){
            let email = document.getElementById("email").value;
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
            if(!valida_nome()) {
                notify("Nome non valido: inserire solo spazi, lettere e '");
                return false;
            }
            if(!valida_cognome()) {
                notify("Cognome non valido: inserire solo spazi, lettere e '");
                return false;
            }
            if(!valida_eta()) {
                notify("Devi avere più di 18 anni");
                return false;
            }
            if(!valida_telefono()) {
                notify("Numero di telefono non valido: inserire 10 cifre consecutive");
                return false;
            }
            if(!valida_mail()) {
                notify("Mail non valida");
                return false;
            }
            if(!valida_username()) {
                notify("Username obbligatorio")
                return false;
            }
            if(!valida_password()) {
                notify("Password non valida: le password inserite devono corrispondere, essere lunghe 8 caratteri, contenere i caratteri d, e, g, l, avere almeno un carattere numerico, un carattere maiuscolo e un carattere tra $, ! e ?");
                return false;
            }

            return true;
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
