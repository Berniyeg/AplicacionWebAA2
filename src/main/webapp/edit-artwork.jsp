<%@ page contentType="text/html;charset=UTF-8" %>

<%@include file="includes/header-style.jsp"%>
<%@include file="includes/edit-ajax.jsp"%>

<body>
<div class="container mt-5">
    <h2>Create Artwork</h2>
    <form>
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
        <button type="submit" class="btn btn-primary" id="edit-button">Submit</button>
    </form>

    <div id="result"></div>

</div>
</body>

<%@include file="includes/footer.jsp"%>