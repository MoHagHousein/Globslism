window.onload = function()
{
    document.getElementsByName("username")[0].focus();
}
function validate()
{
    let username = document.getElementsByName("username")[0].value;
    let password = document.getElementsByName("password")[0].value;

    let error = document.getElementById("error-validation");
    let form = document.getElementsByTagName("form")[0];

    if(username == "" || password == "")
    {
        error.style.display = "block";
        error.innerText = "قم بتعبئة الحقول الفارغة";
        for(let i = 0; i < 2; i++)
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