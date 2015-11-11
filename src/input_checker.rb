class InputChecker
  def checkIfUnitCorrect input
    if input.match(/^[c|f]{1}$/)
      return true
    else
      return false
    end
  end

  def checkIfTemperatureCorrect input
    if input.match(/^\d+ *(\.\d+)?$/) #11/10/15 PS: refactored regular expression to accept decimals
      return true
    else
      return false
    end
  end

  def checkIfFahrenheit input
    if input == "f"
      return true
    end
    false
  end
end