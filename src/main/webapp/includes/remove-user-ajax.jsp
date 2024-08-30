<%@ page contentType="text/html;charset=UTF-8" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function eliminarUser(id) {
        if (confirm("Are you sure you want to delete this user?")) {
            $.ajax({
                url: 'remove-user',
                type: 'GET',
                data: { id: id },
                success: function(response) {
                    if (response.status === 'success') {
                        alert(response.message);

                        $('#user-' + id).remove();
                    } else {
                        alert("Error: " + response.message);
                    }
                },
                error: function() {
                    alert("An error occurred while trying to delete the user.");
                }
            });
        }
    }
</script>
