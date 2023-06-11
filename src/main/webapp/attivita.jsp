<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="header.html"%>
<body>
    <div class="container">
        <%@ include file="navbar.jsp"%>
        <h1 class="page-title">Attività</h1>
        <div class="max-width-medium at-container">
            <div class="at-box">
                <a href="<%=response.encodeURL("paginaattivita_1.jsp")%>">
                    <img src="img/chisiamo_1.jpg" alt="attivita_1" width="150px">
                </a>
                <h3 class="at-p-title">Fornitura di cure mediche<br/><br/></h3>
                <p class="cs-text">Tum4World organizza missioni mediche in cui i volontari, tra cui medici, infermieri e
                    operatori sanitari, offrono cure mediche di base e trattamenti curativi alle persone nei paesi del
                    terzo mondo. Questo include la somministrazione di vaccinazioni, la gestione di malattie
                    croniche, la cura delle ferite e la distribuzione di medicinali essenziali.
                </p>
            </div>
            <div class="at-box">
                <a href="<%=response.encodeURL("paginaattivita_2.jsp")%>">
                    <img src="img/chisiamo_2.jpg" alt="attivita_2" width="150px">
                </a>
                <h3 class="at-p-title">Programmi di educazione sanitaria</h3>
                <p class="cs-text">L'associazione realizza programmi di sensibilizzazione e formazione sulla salute e l'igiene
                    nelle comunità svantaggiate. Attraverso workshop, sessioni informative e materiale educativo,
                    Tum4World insegna pratiche salutari come il lavaggio delle mani, l'igiene alimentare e la
                    prevenzione di malattie trasmissibili, promuovendo così un miglioramento a lungo termine delle
                    condizioni di salute.
                </p>
            </div>
            <div class="at-box">
                <a href="<%=response.encodeURL("paginaattivita_3.jsp")%>">
                    <img src="img/chisiamo_3.jpg" alt="attivita_3" width="150px">
                </a>
                <h3 class="at-p-title">Progetti di sviluppo comunitario</h3>
                <p class="cs-text"> Tum4World collabora con le comunità locali per implementare progetti di sviluppo sostenibile.
                    Ciò include la costruzione di infrastrutture sanitarie, come cliniche o pozzi per
                    l'approvvigionamento di acqua potabile, l'installazione di sistemi di igiene e servizi sanitari
                    adeguati, nonché la promozione di attività agricole o microimprese per creare opportunità economiche
                    e migliorare la sicurezza alimentare.
                </p>
            </div>
        </div>
        <%@ include file="footer.html"%>
        <%@ include file="cookie.jsp"%>s
    </div>
    <script>
        const x = document.getElementById("attivita");
        x.classList.add("selected")
    </script>
</body>
</html>
