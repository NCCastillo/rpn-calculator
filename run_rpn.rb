require_relative "lib/rpn_calculator"

rpn_calculator = RpnCalculator.new

loop do
  begin
    print "> "
    input = gets.chomp
    if input == 'q'
      break
    else
      puts rpn_calculator.evaluate(input)
    end
  rescue RuntimeError => e
    puts "#{e.message}"
    break
  end
end
