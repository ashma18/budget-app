###----------Require relative below
require 'colorize'
require 'terminal-table'

##---arrays below
revenue_array = [{Item: "Coffee", Month: "February", Amount: 50}, 
    {Item: "Muffin", Month: "March", Amount: 30},
    {Item: "Cake", Month: "February", Amount: 30},
    {Item: "Salad", Month: "March", Amount: 30},
    {Item: "water", Month: "February", Amount: 30},
    ]

expenses_array = [{Item: "Coffee", Month: "February", Amount: 30}, 
    {Item: "Muffin", Month: "March", Amount: 30},
    {Item: "Cake", Month: "February", Amount: 30},
    {Item: "Salad", Month: "March", Amount: 30},
    {Item: "water", Month: "February", Amount: 30},
    ]

###----------Methods Below


def add array #Method for adding new entries into array
    puts "which month?"
    new_month = gets.chomp.capitalize
    puts "what item?"
    new_item = gets.chomp.capitalize
    puts "what amount ($)?"
    amount = gets.chomp.to_i
    array << {Item: new_item, Month: new_month, Amount: amount}
end

#----------------- CODE RUNS BELOW ------------------########

while true #Ask questions for which option they would like; add, show, exit
    puts "What do you want to do"
    puts "Add a new revenue item (AR)"
    puts "Show monthly revenue (SAR)"
    puts "Show total year revenue (SMR)"
    puts "Add a new expense item (AE)"
    puts "Show monthly expenses (SME)"
    puts "Show total year Expenses (SYE)"
    puts "Show yearly profit (SYP)"
    puts "Exit (Exit)"
choice = gets.chomp.upcase
total_revenue = revenue_array.reduce(0) {|sum, revenue_item| sum += revenue_item[:Amount]} 
total_expenses = expenses_array.reduce(0) {|sum, revenue_item| sum += revenue_item[:Amount]} 
    case choice
    when "AR" #When they want to add new revenue item, collect information. 
        add revenue_array
    when "SAR" #show all available months 
        rev_hash = Hash.new(0)
        revenue_array.each do |item|
            rev_hash[item[:Month].to_sym] += item[:Amount]
        end
        puts rev_hash
        rev_table = Terminal::Table.new :headings => ['Month', 'Revenue'], :rows => rev_hash
        puts rev_table
    when "SMR"
        puts total_revenue 
    when "AE"
        add expenses_array
    when "SME" 
        exp_hash = Hash.new(0)
        expenses_array.each do |item|
            exp_hash[item[:Month].to_sym] += item[:Amount]
        end
        puts exp_hash
        exp_table = Terminal::Table.new :headings => ['Month', 'Expenses'], :rows => exp_hash 
        puts exp_table
    when "SYE"
       puts total_expenses 
    when "SYP"
        total_profit = (total_revenue) - (total_expenses)
        if total_profit >= 0 
            puts total_profit.to_s.colorize(:green)
        else puts total_profit.to_s.colorize(:red)
        end

    when "EXIT"
        break
    else 
        puts "Invalid Command" 

    end
end        

