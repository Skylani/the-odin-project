var sum = 2;
var first = 1;
var second = 2;
var temp;

while(1)
{
    temp = second;
    second += first;
    first = temp;

    if(second <= 4000000)
    {
        if(second%2===0)
            sum+=second;
    }
    else
        break;
}

console.log("The sum of even Fibonacci numbers smaller than 4,000,000 is " + sum);