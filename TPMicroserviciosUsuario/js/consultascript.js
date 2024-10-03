function buscarrPaquete() {

    const numPaquete = document.getElementById('numpaquete').value;


    if (!numPaquete) {
        alert("Por favor, ingrese un número de paquete.");
        return;
    }


    window.location.href = `consultapaqfinal.html?paquete=${numPaquete}`;
}

window.onload = function() {

    const params = new URLSearchParams(window.location.search);
    const numPaquete = params.get('paquete');

    if (numPaquete) {

        document.getElementById('numero-paquete').textContent = numPaquete;

        const estadoPaquete = Math.random() > 0.5 ? "Aprobado" : "Rechazado"; // Simulación


        document.getElementById('estado-paquete').value = estadoPaquete;

        if (estadoPaquete === "Aprobado") {

            document.getElementById('monto-pagar').style.display = 'block';
            document.getElementById('monto').value = "$1500"; // Ejemplo de monto
        } else {
            document.getElementById('motivo-rechazo').style.display = 'block';
            document.getElementById('motivos').value = "Producto dañado durante el transporte."; // Ejemplo de motivo
        }
    }
}

function buscarPaquete() {
    const numPaquete = document.getElementById('numpaquete').value;
    if (numPaquete) {
        window.location.href = `consultapaqfinal.html?paquete=${numPaquete}`;
    } else {
        alert('Por favor, ingresa un número de paquete.');
    }
}
document.addEventListener("DOMContentLoaded", function() {
    const params = new URLSearchParams(window.location.search);
    const paqueteId = params.get('paquete');

    if (paqueteId) {
        // Realiza la consulta a la API
        fetch(`https://localhost:7169/api/clientes/${paqueteId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Paquete no encontrado');
                }
                return response.json();
            })
            .then(data => {
                // Llena los campos con los datos obtenidos
                document.getElementById('numero-paquete').textContent = paqueteId;
                document.getElementById('estado-paquete').value = data.estado;
                document.getElementById('monto').value = `$${data.precio}`;
            })
            .catch(error => {
                document.getElementById('estado-paquete').value = error.message;
                document.getElementById('monto').value = "";
            });
    } else {
        // Si no hay paquete, redirige o muestra un error
        //alert("No se proporcionó un número de paquete.");
    }
});

async function crearPaquete() {
    try {
        // Obtener los datos del remitente desde el formulario
        const remitente = {
            nombre: document.getElementById('nombreRemitente').value,
            apellido: document.getElementById('apellidoRemitente').value,
            dni: document.getElementById('dniRemitente').value,
            telefono: document.getElementById('telefonoRemitente').value,
            email: document.getElementById('emailRemitente').value
        };

        // Esperar la creación del remitente
        const remitenteId = await postData('https://localhost:7169/api/persona', remitente);


        // Obtener los datos de la dirección del remitente
        const direccionRemitente = {
            calle: document.getElementById('calleRemitente').value,
            altura: document.getElementById('alturaRemitente').value,
            localidad_id: document.getElementById('localidadRemitente').value
        };

        // Esperar la creación de la dirección del remitente
        const direccionRemitenteId = await postData('https://localhost:7169/api/direccion', direccionRemitente);

        // Obtener los datos del destinatario desde el formulario
        const destinatario = {
            nombre: document.getElementById('nombreDestinatario').value,
            apellido: document.getElementById('apellidoDestinatario').value,
            dni: document.getElementById('dniDestinatario').value,
            telefono: document.getElementById('telefonoDestinatario').value,
            email: document.getElementById('emailDestinatario').value
        };

        // Esperar la creación del destinatario
        const destinatarioId = await postData('https://localhost:7169/api/persona', destinatario);

        // Obtener los datos de la dirección del destinatario
        const direccionDestinatario = {
            calle: document.getElementById('calleDestinatario').value,
            altura: document.getElementById('alturaDestinatario').value,
            localidad_id: document.getElementById('localidadDestinatario').value
        };

        // Esperar la creación de la dirección del destinatario
        const direccionDestinatarioId = await postData('https://localhost:7169/api/direccion', direccionDestinatario);

        // Obtener los datos del paquete
        const paquete = {
            direccion1_id: direccionRemitenteId,
            direccion2_id: direccionDestinatarioId,
            persona1_id: remitenteId,
            persona2_id: destinatarioId,
            estado: 'En tránsito', // Puedes cambiar el estado según lo necesario
            precio: document.getElementById('precioPaquete').value
        };

        // Esperar la creación del paquete
        const paqueteId = await postData('https://localhost:7169/api/paquete', paquete);

        // Mostrar el ID del paquete creado
        document.getElementById('result').textContent = `Paquete creado con ID: ${paqueteId}`;
    } catch (error) {
        console.error('Error al crear el paquete:', error);
    }
}

// Función para hacer las peticiones POST
async function postData(url = '', data = {}) {
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    if (!response.ok) {
        throw new Error(`Error HTTP: ${response.status}`);
    }

    return await response.json(); // Espera la respuesta en formato JSON
}