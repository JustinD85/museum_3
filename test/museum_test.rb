require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  attr_reader :dmns, :bob, :sally,
              :gems_and_minerals, :dead_sea_scrolls, :imax

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @sally = Patron.new("Sally", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally.add_interest("IMAX")

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    dmns.admit(bob)
    dmns.admit(sally)
  end

  def test_it_exist
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_has_no_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal [], dmns.exhibits
  end

  def test_it_has_no_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal [], dmns.patrons
  end

  def test_it_has_exhibits
    assert_equal [gems_and_minerals,dead_sea_scrolls,imax], dmns.exhibits
  end

  def test_it_can_reccomend_exhibits
    assert_equal [gems_and_minerals, dead_sea_scrolls],dmns.recommend_exhibits(bob)
    assert_equal [imax], dmns.recommend_exhibits(sally)
  end

  def test_it_can_admit_patrons
    assert_equal [bob, sally], dmns.patrons
  end

  def test_it_can_show_patrons_by_exhibit_interest
    expected = {gems_and_minerals=>[bob], dead_sea_scrolls=>[bob], imax=>[sally]}
    assert_equal expected, dmns.patrons_by_exhibit_interest
  end

  def test_it_can_earn_revenue
    tj = Patron.new("TJ", 16)
    tj.add_interest("IMAX")
    dmns.admit(tj)
    assert_equal 40, dmns.revenue
    assert_equal 1, tj.spending_money

  end

  def test_it_can_return_hash_of_patrons_that_went_to_exhibit
    tj = Patron.new("TJ", 16)
    tj.add_interest("IMAX")
    dmns.admit(tj)

    expected = {gems_and_minerals=>[bob],dead_sea_scrolls=>[bob],imax=>[sally,tj]}

    assert_equal expected, dmns.patrons_of_exhibits
  end

end
