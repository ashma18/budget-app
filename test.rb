require 'colorize'
require_relative 'sandwich'

def expect actual, expected
    if actual == expected then
        puts "PASS"
    else   
        puts "FAIL"
    end

end

def test_for_cheese_sandwich
    sandwich = make_sandwich type: "cheese", bread_count: 5
    number_steps = sandwich.length
    expect number_steps, 5
    
    step_2 = sandwich[1]
    expect step_2, "take 5 pieces of bread"

end

puts test_for_cheese_sandwich




