class RpnCalculator
  def initialize
    @rpn_stack = []
  end

  def evaluate(input)
    case input
      when /[0-9]/
        add_input_to_stack(input)
      when "+", "-", "*", "/"
        calculate_and_add_to_stack(input)
      else
        raise "Operation cannot be performed"
    end

    format_running_number(rpn_stack.last)
  end

  private

  attr_reader :rpn_stack

  def calculate_and_add_to_stack(operator)
    raise "Operation cannot be performed" if rpn_stack.size < 2

    value_2 = rpn_stack.pop
    value_1 = rpn_stack.pop

    rpn_stack << value_1.send(operator, value_2)
  end

  def add_input_to_stack(input)
    rpn_stack << input.to_f
  end

  def format_running_number(number)
    "%g" % ("%.2f" % number)
  end
end
