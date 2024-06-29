require './string_calculator'

RSpec.describe StringCalculator do
  it "returns 0 for an empty string" do
    calculator = StringCalculator.new
    expect(calculator.add("")).to eq(0)
  end
  it "returns the number for a single number" do
    calculator = StringCalculator.new
    expect(calculator.add("1")).to eq(1)
  end
  it 'returns the sum of two numbers' do
    calculator = StringCalculator.new
    expect(calculator.add("1,5")).to eq(6)
  end

  it 'returns the sum of two numbers in string' do
    calculator = StringCalculator.new
    expect(calculator.add("a,5")).to eq(5)
  end

  it "returns the sum of multiple numbers" do
    calculator = StringCalculator.new
    expect(calculator.add("1,2,3")).to eq(6)
  end
end