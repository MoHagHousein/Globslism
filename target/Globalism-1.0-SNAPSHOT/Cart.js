let Amount1 = 1;

function minusA(index) {
    if (Amount1 > 1) {
        Amount1--;
        document.getElementsByClassName("amount-display")[index].innerText = Amount1;
    }
}

function plusA(index) {
    if (Amount1 < 1000) {
        Amount1++;
        document.getElementsByClassName("amount-display")[index].innerText = Amount1;
    }
}

function deleteCartItemOnClick(id, index) {
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            /*
            let element = document.getElementsByClassName("cart-item-container")[index];
            let length = document.querySelectorAll("#cart-items-container .cart-item-container").length;
            if (length == 1) {
                location.reload();
            } else {
                element.remove();
            }
             */
            location.reload();
        }
    };
    xmlHttp.open("GET", "DeleteCartItemProcess.jsp?id=" + id, true);
    xmlHttp.send();
}

function clickedClassHandler(name, callback) {
    let allElements = document.getElementsByTagName("*");

    for (let i = 0, len = allElements.length; i < len; i++) {
        if (allElements[i].className == name) {
            allElements[i].onclick = handleClick;
        }
    }

    function handleClick() {
        let elmParent = this.parentNode;
        let parentChilds = elmParent.childNodes;
        let index = 0;
        for (let i = 0; i < parentChilds.length; i++) {
            if (parentChilds[i] == this) {
                break;
            }
            if (parentChilds[i].className == name) {
                index++;
            }
        }
        callback.call(this, index);
    }
}
function confirmOrder()
{
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function()
    {
        if(this.readyState == 4 && this.status == 200)
        {    alert(this.responseText);
            location.reload();
        }
        xmlHttp.open("GET","index.jsp",true);
        xmlHttp.send();
    };
}