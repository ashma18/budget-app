###----------Require relative below
require 'colorize'
require 'terminal-table'

require_relative 'expenses'
require_relative 'revenue'

###----------Methods Below


def add array #Method for adding new entries into array
    puts "which month?"
    new_month = gets.chomp.capitalize
    puts "what item?"
    new_item = gets.chomp.capitalize
    puts "what amount ($)?"
    amount = gets.chomp.to_i
    array << {item: new_item, month: new_month, Amount: amount}
end

#----------------- CODE RUNS BELOW ------------------########
total_revenue = Revenue::give.reduce(0) {|sum, revenue_item| sum += revenue_item[:Amount]} 
total_expenses = Expenses::give.reduce(0) {|sum, revenue_item| sum += revenue_item[:Amount]} 
while true #Ask questions for which option they would like; add, show, exit
    puts "What do you want to do"
    puts "Add a new revenue item (AR)"
    puts "Display monthly revenue (SAR)"
    puts "Display total year revenue (SYR)"
    puts "Add a new expense item (AE)"
    puts "Display monthly expenses (SAE)"
    puts "Display total year Expenses (SYE)"
    puts "Display yearly profit (SYP)"
    puts "Exit back to main menu (Exit)"
choice = gets.chomp 

    case choice
    when "AR" #When they want to add new revenue item, collect information. 
        add Revenue::give
    when "SAR" #show all available months 
        rev_hash = Hash.new(0)
        Revenue::give.each do |item|
            rev_hash[item[:Month].to_sym] += item[:Amount]
        end
        puts rev_hash
        rev_table = Terminal::Table.new :rows => rev_hash
        puts rev_table
    when "SYR"
        puts total_revenue 
    when "AE"
        add Expenses::give
    when "SAE" 
        exp_hash = Hash.new(0)
        Expenses::give.each do |item|
            exp_hash[item[:Month].to_sym] += item[:Amount]
        end
        puts exp_hash
        exp_table = Terminal::Table.new :rows => exp_hash
        puts exp_table
    when "SYE"
       puts total_expenses 
    when "SYP"
        total_profit = (total_revenue) - (total_expenses)
        puts total_profit
    when "Exit"
        break
    else 
        puts "Invalid Command" 
        break
    end
end        

