require_relative 'temperature_tools'
require_relative 'input_checker'
# parse_unit 'c'
# tool = TemperatureTools.new
# tool.setFahrenheit
# puts  tool.convert 50
# puts tool.average  [30, 34, 32]
puts "Enter unit: "
unit = gets.chomp
check = InputChecker.new
if not check.checkIfUnitCorrect unit
  puts "Error. Wrong entry. Exiting program."
  exit
end

puts "Enter temperature: "
temperature = gets.chomp

if not check.checkIfTemperatureCorrect temperature
  puts "Error. Wrong entry. Exiting program."
  exit
end

tool = TemperatureTools.new
if check.checkIfFahrenheit unit
  tool.setFahrenheit
end

puts  tool.convert temperature.to_f