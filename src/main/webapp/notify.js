const portal = document.getElementById("portal");

const notify = (message) => {
    const p = document.createElement("p");
    const node = document.createTextNode(message);
    p.appendChild(node)
    portal.appendChild(p)
    setTimeout(()=>{p.remove()},12000)
}