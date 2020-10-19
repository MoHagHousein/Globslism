let indexOfReview = 3;
function navDotOnclick1()
{
    indexOfReview = 0;
    document.getElementById("customer-name").innerText = "مايا الراعي";
    document.getElementById("customer-desc").innerText = "\"السرعة في الخدمة تجعل من العالمية شركة مرموقة\""
    document.getElementsByClassName("dot")[0].style.background = "#e8ffe5";
    document.getElementsByClassName("dot")[0].style.borderColor = "#4cd137";
    for(let i = 0; i < 4; i++)
    {
        if(i != 0)
        {
            document.getElementsByClassName("dot")[i].style.background = "lightgray";
            document.getElementsByClassName("dot")[i].style.borderColor = "white";        }
    }
}
function navDotOnclick2()
{
    indexOfReview = 1;
    document.getElementById("customer-name").innerText = "سوسن حسن";
    document.getElementById("customer-desc").innerText = "\"الثقة و الأمانة واحدة من الصفات المهمة لهذه الشركة\""
    document.getElementsByClassName("dot")[1].style.background = "#e8ffe5";
    document.getElementsByClassName("dot")[1].style.borderColor = "#4cd137";
    for(let i = 0; i < 4; i++)
    {
        if(i != 1)
        {
            document.getElementsByClassName("dot")[i].style.background = "lightgray";
            document.getElementsByClassName("dot")[i].style.borderColor = "white";
        }
    }
}
function navDotOnclick3()
{
    indexOfReview = 2;
    document.getElementById("customer-name").innerText = "موسى البني";
    document.getElementById("customer-desc").innerText = "\"شكرا من للقلب لشركة العالمية لأنها مثال للشركات ذات الجودة العالية\""
    document.getElementsByClassName("dot")[2].style.background = "#e8ffe5";
    document.getElementsByClassName("dot")[2].style.borderColor = "#4cd137";
    for(let i = 0; i < 4; i++)
    {
        if(i != 2)
        {
            document.getElementsByClassName("dot")[i].style.background = "lightgray";
            document.getElementsByClassName("dot")[i].style.borderColor = "white";
        }
    }
}
function navDotOnclick4()
{
    indexOfReview = 3;
    document.getElementById("customer-name").innerText = "أحمد حلمي";
    document.getElementById("customer-desc").innerText = "\"بصراحة واحدة من أفضل الشركات التي تعاملت معها, لا يمكنني وصف كمية المحبة و المعاملة" +
        " الجيدة من الموظفين و الاداريين\"";
    document.getElementsByClassName("dot")[3].style.background = "#e8ffe5";
    document.getElementsByClassName("dot")[3].style.borderColor = "#4cd137";
    for(let i = 0; i < 4; i++)
    {
        if(i != 3)
        {
            document.getElementsByClassName("dot")[i].style.background = "lightgray";
            document.getElementsByClassName("dot")[i].style.borderColor = "white";        }
    }
}
window.onload = function ()
{

}
setInterval(slide,5000);
function slide()
{
    if(indexOfReview == 0)
    {
        navDotOnclick2();
    }
    else if(indexOfReview == 1)
    {
        navDotOnclick3();
    }
    else if(indexOfReview == 2)
    {
        navDotOnclick4();
    }
    else if(indexOfReview == 3)
    {
        navDotOnclick1();
    }
}