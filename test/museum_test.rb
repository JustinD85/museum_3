require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  attr_reader :dmns

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exist
    assert_instance_of Museum, dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_has_no_exhibits
    assert_equal [], dmns.exhibits
  end

  def test_it_has_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals,dead_sea_scrolls,imax], dmns.exhibits
  end

  def test_it_can_reccomend_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")

    assert_equal [gems_and_minerals, dead_sea_scrolls],dmns.recommend_exhibits(bob)
    assert_equal [imax], dmns.recommend_exhibits(sally)

  end


end
