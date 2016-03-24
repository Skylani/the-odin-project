var isPrime = function(num) {
    for (var i = 2; i < num; i++) {
        if(num%i===0)
            return false;
    }
    return true;
};

var findPrimeFactor = function(num) {
    for(var i = 2; i < num; i++) {
        if(isPrime(i) && num%i === 0)
            return i;
    }
    return 1; // num is prime
};

function largestPrimeFactor(num) {
    var primeFactor = findPrimeFactor(num);

    // base case
    if(primeFactor == 1) {
        return num;
    }
    else {
        return largestPrimeFactor(num/primeFactor);
    }
}

var num = 600851475143;
var ans = largestPrimeFactor(num);

console.log("The largest prime factor of the number " + num + " is " + ans);