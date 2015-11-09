class InputChecker
  def checkIfUnitCorrect input
    if input.match(/^[c|f]{1}$/)
      return true
    else
      return false
    end
  end

  def checkIfTemperatureCorrect input
    if input.match(/^\d+$/)
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