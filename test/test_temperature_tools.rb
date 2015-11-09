require 'minitest/autorun'
require_relative '../src/input_checker'
require_relative '../src/temperature_tools'
require_relative '../src/weekly_temperatures'

class TestTemperature < Minitest::Test

  def setup
    @temperature = TemperatureTools.new
  end

  def test_celsius_to_fahrenheit_conversion
    @temperature.setCelsius
    temp = @temperature.convert 0
    assert_equal 32, temp
    #assert_kind_of @temperature, TemperatureTools
  end
  def test_fahrenheit_to_celcius_conversion
    @temperature.setFahrenheit
    temp = @temperature.convert 32
    assert_equal 0, temp

    #assert_kind_of @temperature, TemperatureTools
  end

  def test_average

    assert_equal 46.666666666666664, @temperature.average([2,48,90])
  end


  end

