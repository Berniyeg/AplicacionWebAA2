
<%@ page contentType="text/html;charset=UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function eliminarArtwork(id) {
        if (confirm("Are you sure you want to delete this artwork?")) {
            $.ajax({
                url: 'remove-artwork',
                type: 'GET',
                data: { id: id },
                success: function(response) {
                    if (response.status === 'success') {
                        alert(response.message);

                        $('#artwork-' + id).remove();
                    } else {
                        alert("Error: " + response.message);
                    }
                },
                error: function() {
                    alert("An error occurred while trying to delete the artwork.");
                }
            });
        }
    }
</script>
