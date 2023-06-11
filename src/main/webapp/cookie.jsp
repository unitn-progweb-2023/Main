<%
    Boolean cookieValue = (Boolean) session.getAttribute("cookie");
%>

<div id="cookie" class="cookie-container">
    <span class="bold">Cookie</span>
    <span>Il presente sito web utilizza cookie tecnici per garantire il corretto funzionamento della procedure e migliorare l'esperienza di uso delle applicazioni online.</span>
    <button onclick="setCookie()">Accetta</button>
</div>

<script>
    let cookieValue = <%= cookieValue %>;

    if(cookieValue){
        document.getElementById("cookie").remove();
    }

    const setCookie = () => {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", "cookie", true);
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("cookie").remove();
            }
        };
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.send();
    }
</script>