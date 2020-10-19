function deleteOnClick(id)
{
    document.getElementById("delete-confirm").style.display = "block";
    document.getElementById("confirm-title").innerText = "هل أنت متأكد من أنك تريد إزالة المستخدم نهائيا؟";
    document.getElementById("remove").innerText = "إزالة";
    document.getElementById("remove").setAttribute("href", "DeleteUser.jsp?id=" + id);
}
function cancelDeleting()
{
    document.getElementById("delete-confirm").style.display = "none";
}
function hireAsAdminOnClick(id)
{
    document.getElementById("delete-confirm").style.display = "block";
    document.getElementById("confirm-title").innerText = "هل أنت متأكد من أنك تريد تعيين هذا المستخدم كمشرف؟";
    document.getElementById("remove").innerText = "تعيين";
    document.getElementById("remove").setAttribute("href", "HireAsAdmin.jsp?id=" + id);
}