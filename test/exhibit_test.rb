require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'

class ExhibitTest < Minitest::Test
  attr_reader :exhibit

  def setup
    @exhibit = Exhibit.new("Gems and Minerals", 0)
  end

  def test_it_exist
    assert_instance_of Exhibit, exhibit
  end 

  def test_it_has_a_name
    assert_equal "Gems and Minerals", exhibit.name
  end

  def test_it_has_cost
    assert_equal 0, exhibit.cost
  end

end
