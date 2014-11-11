require 'pry'
system('clear')

deposit = %w($$22.0000
GBP44,000
AUD21k
EUR18500
THB10000000.000)

ratios = {'THB'=> 0.035,'$$'=> 1.16,'GBP'=>1.84,'AUD'=>1,'EUR'=>1.44}

puts deposit
puts ratios

class Forex
  attr_reader :deposit, :rates

  def initialize(deposit,ratios)
    @deposit = deposit
    @ratios = ratios
    system('clear')
    cleanse(@deposit,@ratios)
  end

  private
# cleanses the currency
# incorporates the other methods

    def cleanse(deposit, ratios)
    sumtotal = 0
    deposit.map do |money|
     unit = money.match(/^[\D|$]{2,3}/).to_s
     rate = ratios[unit].to_f
     regexxer(money)
     money = ((money.to_f)*rate).round(2)
     sumtotal = sumtotal + money
     puts_subtotal(unit,money,rate,sumtotal)
    end
    puts_grandtotal(sumtotal)
  end

# apply RegEx methods to money
  def regexxer(money)
     money.split(/^[\D|$]{2,3}/).pop
     money.gsub!(/^[\D|$]{2,3}/,'')
     money.gsub!(/k$/i,'000')
     money.gsub!(/,/,'')
     money.gsub!(/\.0+/,'')
  end

# displays running total
  def puts_subtotal(unit,money,rate,sumtotal)
     puts "Convert: #{unit}#{money} at #{rate}x ............Running total: AUD#{sumtotal}"
  end

#displays grand total at end of loop
  def puts_grandtotal(sumtotal)
    2.times { puts }
    puts "Grand total AUD#{sumtotal}"
    2.times { puts }
  end

end

binding.pry