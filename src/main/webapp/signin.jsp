<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <form action="@TODO dove mandare i dati della registrazione" method="POST">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required><br>

            <label for="cognome">Cognome:</label><br>
            <input type="text" id="cognome" name="cognome" required><br>

            <label for="data_nascita">Data di nascita:</label><br>
            <input type="date" id="data_nascita" name="data_nascita" required><br>

            <label for="email">Indirizzo email:</label><br>
            <input type="email" id="email" name="email" required><br>

            <label for="telefono">Numero di telefono:</label><br>
            <input type="tel" id="telefono" name="telefono" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required><br>

            <label>Registrati come</label><br>
            <input type="radio" id="simpatizzante" name="tipo_utente" value="simpatizzante" checked>
            <label for="simpatizzante">simpatizzante</label>
            <input type="radio" id="aderente" name="tipo_utente" value="aderente">
            <label for="aderente">aderente</label><br>

            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username" required><br>

            <label for="password">Password:</label><br>
            <input type="text" id="password" name="password" required><br>

            <input type="submit" value="Registrami">
            <input type="reset" value="Cancella tutto">
        </form>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
