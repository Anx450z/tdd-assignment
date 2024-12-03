class StringCalculator
  def add(string)
    return 0 if  string.nil? || string.empty?
    
    answer = if string.start_with?('//')
                delimiter_part, numbers = string.split("\n",2)
                delimiters = parse_delimiter(delimiter_part)
                sum_of_numbers(numbers, delimiters)
              else
                sum_of_numbers(string)
              end
    answer
  end

  private

  def parse_delimiter(delimiter_part)
    if delimiter_part[2] == '['
      delimiter_part.scan(/\[(.+?)\]/).flatten
    else
      [delimiter_part[2]]
    end
  end

  def sum_of_numbers(string, delimiters = [','])
    delimiter_pattern = Regexp.union(delimiters)
    integers = string.gsub("\n", delimiters.first).split(delimiter_pattern).map do |num|
      num = num.to_i
      num < 1000 ? num : 0
    end
    validates_negative_numbers(integers)
    integers.sum
  end

  def validates_negative_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
