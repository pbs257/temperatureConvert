class TemperatureTools
 @@classvariable = 8
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
    @weekly_temp = File.read("Week_Temperatures.rb").split("; ").collect! { |x| x.to_f } #Review this code for full understanding
    @average = @weekly_temp.inject(0.0) { |result, element| result + element } / @weekly_temp.size
    puts "This week's average temperature is: #{@average.round(2)} degrees Fahrenheit"
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

class Menu < TemperatureTools
  def initialize
  end

  def menu
    @m = Menu.new
    @t = TemperatureTools.new
    puts "What would you like to do?\n1.Set unit & temperature\n2.See current temperature\n3.Convert temperature\n4.See weekly average temperature\n5.Exit\nEnter option number:"
    @option = gets.chomp

    until @option.match(/^[1-5]{1}$/)
      puts "Please enter one of the option numbers (1-5):"
      @option = gets.chomp
    end

    case
      when @option == "1"
        @t.set_unit
        @t.set_temperature
        @t.temp_and_unit
        @m.next
      when @option == "2"
        @t.temp_and_unit
        @m.next
      when @option == "3"
        @t.convert
        @m.next
      when @option == "4"
        @t.average
        @m.next
      when @option == "5"
        puts "Goodbye!"
        exit
    end
  end

  def next
    m = Menu.new
    puts "Would you like to do anything else? (y/n)"
    x = gets.chomp
    until x.match(/^[y|n]{1}$/)
      puts "Please enter only y or n:"
      x = gets.chomp
    end
    case
      when x == "y"
        m.menu
      when x == "n"
        puts "Goodbye!"
        exit
    end
  end
end

#Executed code
t = TemperatureTools.new
n = Menu.new
n.menu

