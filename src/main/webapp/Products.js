let Amount = 1;
let lastClickedProductIndex = 0;
function plusAmount()
{
    if(Amount < 1000)
    {
        Amount++;
        document.getElementById("amount-display").innerText = Amount;
    }
}
function minusAmount()
{
    if(Amount > 1)
    {
        Amount--;
        document.getElementById("amount-display").innerText = Amount;
    }
}
function cancelProductAddition()
{
    Amount = 1;
    document.getElementById("amount-display").innerText = Amount;
    document.getElementById("amount-container").style.display = "none";
}
function AddToCart(index)
{
    document.getElementById("amount-container").style.display = "block";
    document.getElementById("product-title").innerText = document.getElementsByClassName("product-name")[index].innerText;
    lastClickedProductIndex = index;
}
function Add()
{
    let selectedAmount = document.getElementById("amount-display").innerText;
    document.getElementById("notify-circle").style.display = "block";
    document.getElementById("amount-container").style.display = "none";
    let id = document.getElementsByClassName("add-id")[lastClickedProductIndex].value;
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function()
    {
        if(this.readyState == 4 && this.status == 200)
        {
            let x = this.responseText;
            if(x.trim() == "-")
            {

            }
            else {
                let errorElement = document.getElementById("error-message");
                errorElement.style.visibility = "visible";
                document.querySelectorAll("#error-message p")[0].innerHTML = x;
                setTimeout(function () {
                    errorElement.style.visibility = "collapse";
                }, 4000);
            }
        }
    };
    xmlHttp.open("GET", "AddToCartProcess.jsp?id=" + id + "&amt=" + selectedAmount,true);
    xmlHttp.send();
    Amount = 1;
    document.getElementById("amount-display").innerText = Amount;
}

