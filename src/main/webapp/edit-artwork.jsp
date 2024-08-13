<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="includes/header-style.jsp"%>


<body>
<div class="container mt-5">
    <h2>Create Artwork</h2>
    <form action="edit-artwork" method="post">
        <!-- Title -->
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Starry Night" required maxlength="100">
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description"
                      placeholder="A famous painting by Vincent van Gogh" rows="3" maxlength="255"></textarea>
        </div>

        <!-- Price -->
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" step="1.00" class="form-control" id="price"
                   name="price" placeholder="1500,00" required>
        </div>

        <!-- Picture -->
        <div class="form-group">
            <label for="picture">Picture</label>
            <input type="file" class="form-control" id="picture"
                   name="picture" placeholder="starry_night.jpg" maxlength="50">
        </div>


        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>




<%@include file="includes/footer.jsp"%>