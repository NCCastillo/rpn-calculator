require "spec_helper"
require_relative "../lib/rpn_calculator"

describe RpnCalculator do
  it "returns the last inputted value" do
    rpn_calculator = RpnCalculator.new

    expect(rpn_calculator.evaluate("1")).to eq(1)
    expect(rpn_calculator.evaluate("2")).to eq(2)
  end

  it "returns the correct value when adding" do
    rpn_calculator = RpnCalculator.new
    rpn_calculator.evaluate("1")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("+")).to eq(3)
  end

  it "returns the correct value when subtracting" do
    rpn_calculator = RpnCalculator.new
    rpn_calculator.evaluate("3")
    rpn_calculator.evaluate("2")

    expect(rpn_calculator.evaluate("-")).to eq(1)
  end
end
