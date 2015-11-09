require 'minitest/autorun'
require_relative '../src/input_checker'
require_relative '../src/temperature_tools'
require_relative '../src/weekly_temperatures'

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

  def test_wrong_input
    input = '3'
    assert_equal false, @inputchecker.checkIfUnitCorrect(input)
  end

  def test_correct_temperature_input
    input = '45'
    assert_equal true, @inputchecker.checkIfTemperatureCorrect(input)
  end

  def test_incorrect_temperature_input
    input = 'd'
    assert_equal false, @inputchecker.checkIfTemperatureCorrect(input)
  end


end