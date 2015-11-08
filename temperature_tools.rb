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


# def unit #need to change this to attr_reader
#   until @unit.match(/^[c|f]{1}$/)
#     print "Error. For unit, please enter only c or f:"
#     @unit = gets.chomp
#   end
#   if @unit.match(/^[c]{1}$/)
#     @unitName = "Celcius"
#   elsif @unit.match(/^[f]{1}$/)
#     @unitName = "Fahrenheit"
#   end
#   puts "Temperature unit is set to: #{@unitName}"
# end

# def temperature
#   @temperature = gets.chomp
#   until @temperature.match(/^\d+$/)
#     puts "Error. Please enter a valid temperature:"
#     @temperature = gets.chomp
#   end
#   puts "Temperature set to: #{@temperature}"
# end
#
# def temp_and_unit
#   puts "Temperature is set to: #{@temperature}#{@unit}"
# end
#
# def set_temperature
#   puts "Enter temperature:"
#   @temperature = gets.chomp
#   until @temperature.match(/^\d+$/)
#     puts "Error. Please enter a valid temperature:"
#     @temperature = gets.chomp
#   end
# end

# def set_unit
#   puts "Which unit of temperature measurement would you like to convert to the other? Enter c or f (lowercase only):"
#   @unit = gets.chomp
#
#   until @unit.match(/^[c|f]{1}$/)
#     print "Error. Please enter only c or f:"
#     @unit = gets.chomp
#   end
# end


