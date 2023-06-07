<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <h1 class="page-title">Login</h1>

        <form class="max-width-x-small form" action="./loginUtente" method="POST">
            <div class="form-ele-wrapper">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
            </div>

            <div class="form-ele-wrapper">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
                <input class="mostra-password" type="checkbox" onclick="mostra_password()" id="mostrapassword">
                <label for="mostrapassword"></label>
            </div>

            <input class="form-button" type="submit" value="Login">
        </form>
        <%@ include file="footer.html"%>
        <%@ include file="notify-box.html"%>

        <% if(request.getAttribute("error") != null){ %>
        <script>
            console.log("ciao");
            console.log("<%= (String) request.getAttribute("error") %>");
            notify("<%= (String) request.getAttribute("error") %>");
        </script>
        <% } %>
        <% request.removeAttribute("error"); %>
    </div>

    <script>
        function mostra_password(){

            let psw = document.getElementById("password");
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
