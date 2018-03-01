require 'colorize'
require_relative 'dashboard'

def expect(actual, expected)
    if actual == expected then
        puts "PASS".colorize(:green)
    else   
        puts "FAIL".colorize(:red)
    end

end

# def test_rev_add
#     sandwich = make_sandwich type: "cheese", bread_count: 5
#     number_steps = sandwich.length
#     expect number_steps, 5
    

# end

#Test that when method "Add" is used, n + 1 hashes are contained within array. Where n = number of initial 
#hashes in array
def test_rev_add
    rev = revenue_array.length 
    add(revenue_array)
    new_rev = revenue_array.length
    expect(new_rev, (rev) + 1) 
end

# puts test_for_cheese_sandwich




