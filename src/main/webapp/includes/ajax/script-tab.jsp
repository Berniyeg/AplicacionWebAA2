<%@ page contentType="text/html;charset=UTF-8" %>

<script>
    function openTab(evt, tabName) {
        // Ocultar todos los contenidos de pestañas
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Eliminar la clase "active" de todos los botones de pestañas
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Mostrar la pestaña seleccionada y agregar la clase "active" al botón que abrió la pestaña
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Por defecto, abrir la primera pestaña
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelector(".tablinks").click();
    });

</script>