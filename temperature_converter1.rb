class TemperatureTools
  def initialize
    @unit = 'f'
    @temperature = nil
    #Need to figure out how to prompt for input at this stage.
  end

  def changeUnitToCelsius
    @unit = 'c'
  end
  def changeUnitToFahrenheit
    @unit = 'f'
  end



  def unit #need to change this to attr_reader
    until @unit.match(/^[c|f]{1}$/)
      print "Error. For unit, please enter only c or f:"
      @unit = gets.chomp
    end
    if @unit.match(/^[c]{1}$/)
      @unitName = "Celcius"
    elsif @unit.match(/^[f]{1}$/)
      @unitName = "Fahrenheit"
    end
    puts "Temperature unit is set to: #{@unitName}"
  end

  def temperature
    @temperature = gets.chomp
    until @temperature.match(/^\d+$/)
      puts "Error. Please enter a valid temperature:"
      @temperature = gets.chomp
    end
    puts "Temperature set to: #{@temperature}"
  end

  def temp_and_unit
    puts "Temperature is set to: #{@temperature}#{@unit}"
  end

  def set_temperature
    puts "Enter temperature:"
    @temperature = gets.chomp
    until @temperature.match(/^\d+$/)
      puts "Error. Please enter a valid temperature:"
      @temperature = gets.chomp
    end
  end

  def set_unit
    puts "Which unit of temperature measurement would you like to convert to the other? Enter c or f (lowercase only):"
    @unit = gets.chomp

    until @unit.match(/^[c|f]{1}$/)
      print "Error. Please enter only c or f:"
      @unit = gets.chomp
    end
  end


  def average
    @weekly_temp = Array.new
    @weekly_temp = File.read("weekly_temperatures.rb").split("; ").collect! { |x| x.to_f } #Review this code for full understanding
    @average = @weekly_temp.inject(0.0) { |result, element| result + element } / @weekly_temp.size
    puts "This week's average temperature is: #{@average.round(2)} degrees Fahrenheit"
  end

  def temp_max
    @weekly_temp = Array.new
    @weekly_temp = File.read("weekly_temperatures.rb").split("; ").collect! { |x| x.to_f }
    puts "The maximum temperature is: #{@weekly_temp.max}"
  end

  def temp_min
    @weekly_temp = Array.new
    @weekly_temp = File.read("weekly_temperatures.rb").split("; ").collect! { |x| x.to_f }
    puts "The minimum temperature is: #{@weekly_temp.min}"
  end

  def temp_median
    @weekly_temp = Array.new
    @weekly_temp = File.read("weekly_temperatures.rb").split("; ").collect! { |x| x.to_f }
    @sorted = @weekly_temp.sort
    @len = @weekly_temp.length
    @median = @len % 2 == 1 ? @sorted[@len / 2] : (@sorted[@len/2 - 1] + @sorted[@len/2]).to_f / 2
    puts "The median temperature is: #{@median}"
  end

  def convert
    if @unit.match(/c/)
      @temperatureConvert = (@temperature.to_f * 9) / 5 + 32
      @measurement = "Fahrenheit"
    elsif @unit.match(/f/)
      @temperatureConvert = ((@temperature.to_f - 32) * 5) / 9
      @measurement = "Celcius"
    end

    puts "#{@temperature} #{@unit} converted  to #{@measurement} is: #{@temperatureConvert.round(2)} degrees."
  end
end

#Workflow
a = TemperatureTools.new
a.temp_max
a.temp_min
a.temp_median
a.average
a.set_unit
a.set_temperature
a.convert


