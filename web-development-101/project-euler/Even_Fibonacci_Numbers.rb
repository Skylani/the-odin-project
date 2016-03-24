sum = 2
first = 1
second = 2

loop do
    temp = second
    second += first
    first = temp

    if second <= 4000000
        if second%2 == 0
            sum+=second
        end
    else
        break
    end
end

puts sum