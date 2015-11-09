class TemperatureTools

  @@peters_variable = "I am a class variable"
  def initialize
    @unit = 'f'
    @celsius = true;
    @temperature = nil
  end

  def setCelsius
    @celsius = true
  end
  def setFahrenheit
    @celsius = false
  end



  def average temperatures
    temperatures.inject(0.0) { |result, element| result + element } / temperatures.size
  end

  def temp_max temperatures
    temperatures.max
  end

  def temp_min temperatures
    temperatures.min
  end

  def temp_median temperatures
    sorted = temperatures.sort
    len = temperatures.length
    len % 2 == 1 ? sorted[len / 2] : (sorted[len/2 - 1] + sorted[len/2]).to_f / 2
  end

  def convert temperature
    if @celsius
      temperatureConvert = (temperature * 9) / 5 + 32

    else
      temperatureConvert = ((temperature - 32) * 5) / 9

    end

    return temperatureConvert
  end
end

