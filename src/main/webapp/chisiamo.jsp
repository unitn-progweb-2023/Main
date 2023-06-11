<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <h1 class="page-title">Chi Siamo</h1>
        <div class="max-width-small cs-container">
            <h3 class="cs-p-title">L'associazione</h3>
            <div class="cs-box">
                <p class="cs-text">
                    <b>Tum4World</b> è un'associazione <i>no-profit</i> che si dedica con passione a fornire cure e supporto
                    alle persone nei paesi del terzo mondo. Attraverso il prezioso impegno dei suoi volontari e grazie alle
                    generose donazioni ricevute, l'associazione è in grado di realizzare interventi sanitari vitali in
                    comunità svantaggiate.
                    <br>
                    Tum4World lavora incessantemente per garantire l'accesso alle cure mediche di
                    base, la fornitura di medicinali essenziali e la promozione dell'igiene e della prevenzione delle malattie.
                </p>
                <img class="float-right" src="img/chisiamo_3.jpg" width="400px" alt="chi siamo">
            </div>
            <h3 class="cs-p-title">La nostra storia</h3>
            <div class="cs-box">
                <img src="img/chisiamo_4.jpg" width="400px" alt="chi siamo">
                <p class="cs-text">
                    Durante una vacanza nel 2025, <em>Pino e Pina</em> rimasero profondamente colpiti dalle condizioni di
                    vita difficili dei paesi del terzo mondo. Decisero di fare la differenza e fondarono l'associazione
                    <b>Tum4World</b>. Con il supporto
                    di volontari appassionati e generose donazioni, Tum4World si impegna a fornire assistenza medica, cure
                    preventive e programmi educativi per migliorare la qualità della vita delle persone bisognose.
                    Attraverso eventi di raccolta fondi e collaborazioni, l'associazione continua a crescere e a raggiungere
                    sempre più comunità, portando speranza e guarigione. La dedizione di Pino, Pina e di tutti i volontari
                    è guidata dalla missione di rendere il mondo un posto migliore per tutti.
                </p>
            </div>

            <h3 class="cs-p-title">I nostri risultati</h3>
            <div class="cs-box">
                <p class="cs-text">Ad oggi siamo più di <strong>800 volontari!</strong><br/><br/>Abbiamo già curato più di <strong>10 000 persone</strong> e ci hanno riconosciuto come
                    <strong>Best Association of the World 2027!</strong></p>
                <img src="img/chisiamo_1.jpg" height="300px" alt="chi siamo">
                <img src="img/chisiamo_2.jpg" height="300px" alt="chi siamo">
            </div>
        </div>
        <%@ include file="footer.html"%>
        <%@ include file="cookie.jsp"%>
    </div>
    <script>
        const x = document.getElementById("chisiamo");
        x.classList.add("selected")
    </script>
</body>
</html>
