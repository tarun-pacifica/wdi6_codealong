require 'pry'
system('clear')

deposit = %w($$22.0000
GBP44,000
AUD21k
EUR18500
THB10000000.000)

ratios = {'THB'=> 0.035,'$$'=> 1.16,'GBP'=>1.84,'AUD'=>1,'EUR'=>1.44}

class Forex
  attr_reader :deposit, :rates

  def initialize(deposit,ratios)
    @deposit = deposit
    @ratios = ratios
    cleanse(@deposit,@ratios)
  end

  def cleanse(deposit, ratios)
    system('clear')
    sumtotal = 0
    deposit.map do|money|
     unit = money.match(/^[\D|$]{2,3}/).to_s
     rate = ratios[unit].to_f
     money.split(/^[\D|$]{2,3}/).pop
     money.gsub!(/^[\D|$]{2,3}/,'')
     money.gsub!(/k$/i,'000')
     money.gsub!(/,/,'')
     money.gsub!(/\.0+/,'')
     money = money.to_f
     money = (money*rate).round(2)
     sumtotal = sumtotal + money
     puts "Convert: #{unit}#{money} at #{rate}x :Running total: AUD#{sumtotal}"
    end
    puts
    puts
    puts "Grand total AUD:#{sumtotal}"
    puts
    puts
  end
end

binding.pry