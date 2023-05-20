<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.html"%>
        <h1 class="page-title">Login</h1>
        <form class="max-width-x-small form" action="@TODO dove mandare i dati del login" method="POST">
            <div class="form-ele-wrapper">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-ele-wrapper">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <input class="form-button" type="submit" value="Login">
        </form>
        <%@ include file="footer.html"%>
    </div>

</body>
</html>
