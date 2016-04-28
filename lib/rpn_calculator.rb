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
          rpn_store << item.to_i
        when "+"
          value_2 = rpn_store.pop
          value_1 = rpn_store.pop

          rpn_store << value_1 + value_2
      end
    end

    rpn_store.last
  end

  private

  attr_reader :input_store, :rpn_store
end
