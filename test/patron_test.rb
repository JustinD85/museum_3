require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < Minitest::Test
  attr_reader :bob

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exist
    assert_instance_of Patron, bob
  end

  def test_it_has_a_name
    assert_equal "Bob", bob.name
  end

  def test_it_has_money_to_spend
    assert_equal 20, bob.spending_money
  end

  def test_it_has_no_interests
    assert_equal [], bob.interests
  end

  def test_it_can_add_interests
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end
end
