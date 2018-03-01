require 'colorize'
require_relative 'dashboard'

def expect(actual, expected)
    if actual == expected then
        puts "PASS".colorize(:green)
    else   
        puts "FAIL".colorize(:red)
    end

end


#Test that when method "Add" is used, n + 1 hashes are contained within array. Where n = number of initial 
#hashes in array
def test_rev_add revenue_array
    rev = revenue_array.length 
    add (revenue_array)
    new_rev = revenue_array.length
    expect(new_rev, (rev) + 1) 
end

puts test_rev_add revenue_array


































puts "TDD IS GREAT ALL GREEN".colorize(:green)

