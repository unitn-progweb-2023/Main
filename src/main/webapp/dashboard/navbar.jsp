<div class="navbar max-width">
  <h1 class="navbar-title">Tum4World</h1>
  <ul class="navbar-menu">
    <li><a id="homepage" class="navbar-menu-item" href=<%=response.encodeURL("../")%>>Home Page</a></li>
    <li><a id="chisiamo" class="navbar-menu-item" href=<%=response.encodeURL("../chisiamo.jsp")%>>Chi siamo</a></li>
    <li><a id="attivita" class="navbar-menu-item" href=<%=response.encodeURL("../attivita.jsp")%>>Attivit&#224;</a></li>
    <li><a id="contatti" class="navbar-menu-item" href=<%=response.encodeURL("../contatti.jsp")%>>Contatti</a></li>
  </ul>
  <ul class="navbar-menu">
    <li><a  class="navbar-menu-item logout" href=<%=response.encodeURL("./logout")%>>Logout</a></li>
  </ul>
</div>
