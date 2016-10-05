# This code calculates the different shopping cart scenarios
# to arrive at a subtotal that is a multiple of INTERVAL less
# than MAX_TOTAL.  This was written for the LEGO VIP rewards
# program where rewards can only be spent $5 at a time.

MAX_TOTAL = 530
SEED = [499.99]
VALS = [
    2.48,
    2.49,
    3.48,
    3.98,
    3.99,
    4.99,
    5.59,
    5.99,
    6.39,
    6.99,
    7.49,
    7.99,
    8.99,
    9.98,
    9.99,
    10.39,
    10.48,
    11.99,
    12.99,
    13.59,
    13.99,
    14.99,
    15.99,
    16.99,
    18.99,
    19.99,
    21.99,
    23.99,
    24.99,
    29.99,
    31.99,
    34.99,
    36.99,
    39.99,
    44.99,
    47.99,
    49.79,
    49.99,
    54.99,
    59.99,
    64.99,
    69.99,
    71.99,
    79.99,
    84.99,
    89.99,
    99.99,
    109.99,
    119.99,
    129.99,
    139.99,
    149.99,
    159.99,
    169.99,
    179.99,
    189.99,
    199.99,
    229.99,
    239.99,
    249.99,
    269.99,
    279.99,
    299.99,
    319.99,
    349.99
].sort
INTERVAL = 5

def sum_arr(arr)
    return arr.inject(0){ |result, elem| result + elem }.round(2)
end

def calc(arr)
    results = []
    VALS.each do |val|
        next if arr.last < val || sum_arr(arr) + val > MAX_TOTAL
        result = arr.dup
        result << val
        #puts result.to_s
        #puts sum_arr(result)
        if sum_arr(result) % INTERVAL == 0
            results << result
        else
            results.concat(calc(result))
        end
    end
    results
end

def run_calc
    output = calc(SEED).sort_by!{|row| sum_arr(row)}
    output.each do |row|
        #puts row.to_s
        #puts sum_arr(row)
        puts "#{sum_arr(row)}," + row.join(",") + ","
    end
end

run_calc
