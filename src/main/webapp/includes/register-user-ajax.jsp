<%@ page contentType="text/html;charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#register-user-form").on("submit", function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                url: "register-user",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {

                    $("#result").html(response);
                },
                error: function(xhr, status, error) {

                    $("#result").html("<div class='alert alert-danger' role='alert'>Error al enviar el formulario.</div>");
                }
            });
        });
    });
</script>
