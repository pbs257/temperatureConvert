class TemperatureTools

  @@peters_variable = "I am a class variable" #QUESTION: How do I access class variables outside of the class? For example, I'm trying to output the converted number's unit. I'd like to designate this in TemperatureTools and output in main. How do I do this?
  def initialize
    @unit = 'f'
    @celsius = false; #11/10/15 PS-Changed from 'true'.
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

