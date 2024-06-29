require './string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end
  it "returns the number for a single number" do
    expect(calculator.add("1")).to eq(1)
  end
  it 'returns the sum of two numbers' do
    expect(calculator.add("1,5")).to eq(6)
  end

  it 'returns the sum of two numbers in string' do
    expect(calculator.add("a,5")).to eq(5)
  end

  it "returns the sum of multiple numbers" do
    expect(calculator.add("1,2,3")).to eq(6)
  end

  it "handles new lines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  context 'when input contains a custom delimiter' do
    it 'returns the sum with a semicolon delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'returns the sum with a pipe delimiter' do
      expect(calculator.add("//|\n1|2|3")).to eq(6)
    end

    it 'returns the sum with a dash delimiter' do
      expect(calculator.add("//-\n4-5-6")).to eq(15)
    end

    it 'returns the sum with an asterisk delimiter' do
      expect(calculator.add("//*\n7*8*9")).to eq(24)
    end

    it 'returns the sum with a dot delimiter' do
      expect(calculator.add("//.\n10.20.30")).to eq(60)
    end

    it 'returns the sum with multiple characters delimiter' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'returns the sum with a custom delimiter and new lines' do
      expect(calculator.add("//;\n1;2\n3")).to eq(6)
    end
  end
end