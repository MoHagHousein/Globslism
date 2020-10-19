function deleteOnClick(id)
{
    document.getElementById("delete-confirm").style.display = "block";
    document.getElementById("remove").setAttribute("href", "DashboardDeleteProduct.jsp?id=" + id);
}
function cancelDeleting()
{
    document.getElementById("delete-confirm").style.display = "none";
}