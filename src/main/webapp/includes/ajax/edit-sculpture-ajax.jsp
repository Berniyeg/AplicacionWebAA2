<%@ page contentType="text/html;charset=UTF-8" %>

<script type="text/javascript">
    $(document).ready(function() {
        $("#sculpture-form").on("submit", function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                url: "edit-sculpture",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    $("#result-sculpture").html(data);
                },
                error: function(xhr, status, error) {
                    $("#result-sculpture").html("<div class='alert alert-danger' role='alert'>Error al enviar el formulario.</div>");
                }
            });
        });
    });
</script>
