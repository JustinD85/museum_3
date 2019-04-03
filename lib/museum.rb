class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all { |exhibit| patron.interests.include? exhibit.name }
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |result, exhibit|
      result[exhibit] = @patrons.find_all do |patron|
        patron.interests.include? exhibit.name
      end
      result
    end
  end
end
