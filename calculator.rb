class StringCalculator
  def add(string)
    return 0 if string.empty?

    answer = if string.start_with?('//')
                delimiter = string[2]
                numbers = string.split('\n').last
                sum_of_numbers(numbers, delimiter)
              else
                sum_of_numbers(string)
              end
    return answer
  end

  private

  def sum_of_numbers(string, delimiter = ',')
    return string.gsub('\n', delimiter).split(delimiter).map(&:to_i).sum
  end
end
