require "spec_helper"
require_relative "../lib/rpn_calculator"

describe RpnCalculator do
  let(:rpn_calculator) { RpnCalculator.new }

  it "returns the last inputted value" do
    expect(rpn_calculator.evaluate("1")).to eq("1")
    expect(rpn_calculator.evaluate("2")).to eq("2")
  end

  it "returns the correct value when adding" do
    rpn_calculator.evaluate("1")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("+")).to eq("3")
  end

  it "returns the correct decimal value when adding" do
    rpn_calculator.evaluate("3.5")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("+")).to eq("5.5")
  end

  it "returns the correct value when subtracting" do
    rpn_calculator.evaluate("3")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("-")).to eq("1")
  end

  it "returns the correct value when multiplying" do
    rpn_calculator.evaluate("2")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("*")).to eq("4")
  end

  it "returns the correct value when dividing " do
    rpn_calculator.evaluate("2")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("/")).to eq("1")
  end

  it "returns the correct decimal value when dividing" do
    rpn_calculator.evaluate("7")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("/")).to eq("3.5")
  end

  it "returns the correct value when calculating with multiple operators" do
    # -3 -2 * 5 +
    rpn_calculator.evaluate("-3")
    rpn_calculator.evaluate("-2")
    rpn_calculator.evaluate("*")
    rpn_calculator.evaluate("5")

    expect(rpn_calculator.evaluate("+")).to eq("11")
  end

  it "raises error when wrong operation is performed" do
    rpn_calculator.evaluate("8")
    expect { rpn_calculator.evaluate("+") }.to raise_error(RuntimeError, "Operation cannot be performed")
  end

  it "raises error when invalid input is given" do
    expect { rpn_calculator.evaluate("e") }.to raise_error(RuntimeError, "Operation cannot be performed")
  end
end
