<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#login-form").on("submit", function(event) {
            event.preventDefault(); // Evita que el formulario se envíe de la manera tradicional

            var formData = $(this).serialize(); // Serializa los datos del formulario

            $.ajax({
                url: "login", // URL del servlet de login
                type: "POST",
                data: formData,
                success: function(response) {
                    // Si la respuesta es "ok", redirige al index.jsp
                    if (response.trim() === "ok") {
                        window.location.href = "index.jsp"; // Redirige a la página principal
                    } else {
                        $("#result").html("<div class='alert alert-danger' role='alert'>Credenciales inválidas.</div>");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Status: " + status); // Muestra el estado en la consola
                    console.error("Error: " + error); // Muestra el error en la consola
                    $("#result").html("<div class='alert alert-danger' role='alert'>Error al enviar el formulario. Status: " + status + ", Error: " + error + "</div>");
                }
            });
        });
    });
</script>
