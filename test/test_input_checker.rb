require 'minitest/autorun'
require_relative '../src/input_checker'
require_relative '../src/temperature_tools'
require_relative '../src/weekly_temperatures' #is this needed still?

class TestInputChecker < Minitest::Test

  def setup
    @inputchecker = InputChecker.new

  end

  def test_fahrenheit_checker
    input = 'f'
    assert_equal true, @inputchecker.checkIfFahrenheit(input)
  end

  def test_celcius_checker
    input = 'c'
    assert_equal false, @inputchecker.checkIfFahrenheit(input)
  end

  def test_wrong_unit_input
    input = '3'
    assert_equal false, @inputchecker.checkIfUnitCorrect(input)
  end

  def test_whole_number_temperature_input
    input = '45'
    assert_equal true, @inputchecker.checkIfTemperatureCorrect(input)
  end

  def test_decimal_temperature_input
    input = '45.5'
    assert_equal true, @inputchecker.checkIfTemperatureCorrect(input)
  end

  #QUESTION: Is there a way of testing if input will fail for any number of numbers on either side of the decimal point without hard coding it all?

  def test_multiple_decimal_input
    input = '45.5.5'
    assert_equal false, @inputchecker.checkIfTemperatureCorrect(input)
  end

  def test_incorrect_temperature_input
    input = 'd'
    assert_equal false, @inputchecker.checkIfTemperatureCorrect(input)
  end


end