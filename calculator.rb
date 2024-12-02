class StringCalculator
  def add(string)
    return 0 if string.empty?

    return string.to_i if string.length == 1
  end
end
