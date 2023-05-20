<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<script>
    function maggiorenne(){
        let ora = new Date();
        let input = new Date(document.getElementById("data_nascita").value);
        let diff = new Date(ora - input);
        let eta = Math.abs(diff.getUTCFullYear() - 1970);
        return eta >= 18;
        /*try {
            return new Date(new Date() - new Date(document.getElementById("data_nascita").value)).getUTCFullYear()>1970;
        } catch (e) {
            return false;
        }*/
    }
    function valida_password(){
        let psw = document.getElementById("password").value;
        return psw == document.getElementById("confermapassword").value && /(?=.*[0-9])(?=.*[dD])(?=.*[eE])(?=.*[gG])(?=.*[lL])(?=.*[$!?])(?=.*[A-Z]).{8,}/.test(psw);
    }
    function valida_mail(){
        let email = document.getElementById("email").value;
        return /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email);
    }
    function valida_form(){
        // gestione errori singolarmente?
        return (maggiorenne() && valida_password() && valida_mail());
    }
</script>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <h1 class="page-title">Registrazione</h1>
        <form class="max-width-x-small form" action="@TODO dove mandare i dati della registrazione" onsubmit="return valida_form()" method="POST">
            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="nome">Nome</label>
                    <input type="text" id="nome" name="nome" pattern="(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')^[a-zA-Z]+[a-zA-Z'\s]*$" required>
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="cognome">Cognome</label>
                    <input type="text" id="cognome" name="cognome" pattern="(?!.*'')(?!.*\s\s)(?!.*'(\s*\w*)')^[a-zA-Z]+[a-zA-Z'\s]*$" required>
                </div>
            </div>

            <div class="form-ele-wrapper">
                <label class="obbligatorio" for="data_nascita">Data di nascita</label>
                <input type="date" id="data_nascita" name="data_nascita" required>
            </div>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="email">Indirizzo email</label>
                    <input type="email" id="email" name="email" required placeholder="example@domain.com">
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="telefono">Numero di telefono</label>
                    <input type="tel" id="telefono" name="telefono" pattern="^[0-9]{10}$" required placeholder="3401234789">
                </div>
            </div>

            <div class="radio">
                <label class="obbligatorio">Tipologia utente:</label>
                <div>
                    <input type="radio" id="simpatizzante" name="tipo_utente" value="simpatizzante" checked>
                    <label for="simpatizzante">simpatizzante</label>
                </div>

                <div>
                    <input type="radio" id="aderente" name="tipo_utente" value="aderente">
                    <label for="aderente">aderente</label>
                </div>
            </div>

            <div class="form-ele-wrapper">
                <label class="obbligatorio" for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-row">
                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-ele-wrapper">
                    <label class="obbligatorio" for="confermapassword">Conferma Password</label>
                    <input type="password" id="confermapassword" name="confermapassword" required>
                </div>
            </div>

            <div class="form-row">
                <input class="form-button" type="submit" value="Registrami">
                <input class="form-button" type="reset" value="Cancella tutto">
            </div>
        </form>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
