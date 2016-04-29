class RpnCalculator
  def initialize
    @input_store = []
    @rpn_store = []
  end

  def evaluate(input)
    input_store << input

    input_store.each do |item|
      case item
        when /[0-9]/
          rpn_store << item.to_f
        when "+", "-", "*", "/"
          calculate_and_add_to_store(item)
        else
          raise "Operation cannot be performed"
      end
    end

    input_store.clear
    rpn_store.last
  end

  private

  attr_reader :input_store, :rpn_store

  def calculate_and_add_to_store(operator)
    raise "Operation cannot be performed" if rpn_store.size < 2

    value_2 = rpn_store.pop
    value_1 = rpn_store.pop

    rpn_store << value_1.send(operator, value_2)
  end
end
