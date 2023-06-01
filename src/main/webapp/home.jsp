<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <div class="image-container">
            <img src="img/logo-trasparent.png">
        </div>

        <div class="hp-title-container">
            <h1 class="hp-title">Tum4World</h1>
        </div>

        <div class="hp-text-container max-width-small">
            <img class="in-text-image" src="img/homepage_1.jpg">
            <h2 class="hp-p-title">Un p&ograve; su di noi </h2>
            <p class="hp-text">La nostra associazone <i>no-profit</i> si prepone l'obbiettivo di aiutare tutte le persone che vivono nei paesi del terzo mondo. Mediante il supporto ricevuto dai suoi volontari e donatori Tum4World ha realizzato interventi sanitari aiutando comunità svantaggiate in giro nel mondo.</p>
            <a class="hp-dowload" href="./VolantinoA5.pdf" download="volantino">Scarica Volantino</a>
        </div>

        <%@ include file="footer.html"%>
    </div>
    <script>
        const x = document.getElementById("homepage");
        x.classList.add("selected")
    </script>
</body>
</html>