
<%@ page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-artwork", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>