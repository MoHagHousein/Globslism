let numberOfPages = 4;
window.onload = function()
{
    changeToCurrentActiveLink();
}
function changeToCurrentActiveLink()
{
    let CurrentPagePath = window.location.pathname;
    let CurrentPageName = CurrentPagePath.split("/").pop();
    document.getElementById("active-page").removeAttribute("id");

    if(CurrentPageName == "index.jsp" || CurrentPageName == "")
    {
        document.getElementsByClassName("header-link")[numberOfPages - 1].setAttribute("id", "active-page");
    }
    else if(CurrentPageName == "Products.jsp")
    {
        document.getElementsByClassName("header-link")[numberOfPages - 2].setAttribute("id", "active-page");
    }
    else if(CurrentPageName == "Help.jsp")
    {
        document.getElementsByClassName("header-link")[numberOfPages - 3].setAttribute("id", "active-page");
    }
    else if(CurrentPageName == "About.jsp")
    {
        document.getElementsByClassName("header-link")[numberOfPages - 4].setAttribute("id", "active-page");
    }
    else if(CurrentPageName == "SignUp.jsp")
    {
        document.getElementById("header").style.position = "static";
        document.getElementById("menu").style.display = "none";
        document.getElementById("sign-in-up").style.display = "none";
    }
    else if(CurrentPageName == "SignIn.jsp")
    {
        document.getElementById("header").style.position = "static";
        document.getElementById("menu").style.display = "none";
        document.getElementById("sign-in-up").style.display = "none";
    }
    else if(CurrentPageName == "Dashboard.jsp")
    {
        document.getElementById("header").style.position = "static";
        document.getElementById("menu").style.display = "none";
        document.getElementById("sign-in-up").style.display = "none";
    }
    else if(CurrentPageName == "Cart.jsp")
    {
        document.getElementById("header").style.position = "fixed";
        document.getElementById("header").style.padding = "15px";
        document.getElementById("menu").style.display = "none";
        document.getElementById("shopping-cart-icon").remove();
    }
}
function logOut()
{
    document.cookie = "id=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=localhost;"
    location.reload();
}
function cartOnClick()
{
    window.location = "Cart.jsp";
}