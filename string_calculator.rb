# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      delimiter_section, numbers = numbers[2..].split("\n", 2)
      if delimiter_section.start_with?("[") && delimiter_section.end_with?("]")
        delimiter = Regexp.escape(delimiter_section[1..-2])
      else
        delimiter = Regexp.escape(delimiter_section)
      end
      delimiter = Regexp.new(delimiter + "|\\n")
    end

    num_array = numbers.split(delimiter).map(&:to_i)
    negatives = num_array.select { |n| n < 0 }

    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    num_array.sum
  end
end
