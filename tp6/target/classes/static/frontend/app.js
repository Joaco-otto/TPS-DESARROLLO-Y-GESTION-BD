const API_URL = "http://localhost:8089/autos";

document.addEventListener("DOMContentLoaded", cargarVehiculos);

// Cargar vehículos
function cargarVehiculos() {
    fetch(API_URL)  
        .then(res => res.json())
        .then(data => mostrarTabla(data));
}

function mostrarTabla(vehiculos) {
    const tbody = document.querySelector("#tablaVehiculos tbody");
    tbody.innerHTML = "";

    vehiculos.forEach(v => {
        const tr = document.createElement("tr");

        tr.innerHTML = `
            <td>${v.id}</td>
            <td>${v.marca}</td>
            <td>${v.precio}</td>
            <td><button class="delete-btn" onclick="eliminarVehiculo(${v.id})">Eliminar</button></td>
        `;

        tbody.appendChild(tr);
    });
}

// Guardar vehículo
document.getElementById("formVehiculo").addEventListener("submit", function(e){
    e.preventDefault();

    const marca = document.getElementById("marca").value;
    const precio = document.getElementById("precio").value;

    fetch(API_URL, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ marca, precio })
    })
    .then(() => {
        cargarVehiculos();
        this.reset();
    });
});

// Eliminar vehículo
function eliminarVehiculo(id) {
    if (!confirm("¿Seguro que querés eliminar este vehículo?")) return;

    fetch(`${API_URL}/${id}`, {
        method: "DELETE"
    })
    .then(() => cargarVehiculos());
}
