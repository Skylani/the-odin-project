def is_prime num
    for i in 2..num-1 do
        if num%i == 0
            return false
        end
    end
    return true
end

def find_prime_factor num
    for i in 2..num-1 do
        if is_prime(i) and num%i == 0
            return i
        end
    end
    1
end

def largest_prime_factor num
    prime_factor = find_prime_factor(num)

    if prime_factor == 1
        return num
    else
        return largest_prime_factor(num/prime_factor)
    end
end

num = 600851475143
ans = largest_prime_factor num
puts ans