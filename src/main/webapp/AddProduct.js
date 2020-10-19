window.onload = function()
{
    document.getElementsByName("username")[0].focus();
}
function validate()
{
    let name = document.getElementsByName("name")[0].value;
    let desc = document.getElementsByName("desc")[0].value;
    let price = document.getElementsByName("price")[0].value;

    let error = document.getElementById("error-validation");
    let form = document.getElementsByTagName("form")[0];

    if(name == "" || desc == "" || price == "")
    {
        error.style.display = "block";
        error.innerText = "قم بتعبئة الحقول الفارغة";
        for(let i = 0; i < 3; i++)
        {
            let input = document.getElementsByClassName("in")[i].value;
            if(input == "")
            {
                document.getElementsByClassName("in")[i].focus();
                break;
            }
        }
    }
    else
    {
        form.submit();
    }
}
function submitSign(e)
{
    if(e.keyCode == 13)
    {
        validate();
    }
}