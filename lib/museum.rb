class Museum
  attr_reader :name, :exhibits, :patrons, :revenue, :patrons_of_exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
    @patrons_of_exhibits = {}
  end

  def add_exhibit(exhibit)
    exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all { |exhibit| patron.interests.include? exhibit.name }
  end

  def admit(patron)
    @patrons << patron
    @exhibits.each do |exhibit|
      if (patron.spending_money >= exhibit.cost && patron.interests.include?(exhibit.name))
        patron.spending_money -= exhibit.cost
        @revenue += exhibit.cost

        @patrons_of_exhibits[exhibit] = [] unless  @patrons_of_exhibits[exhibit]
        @patrons_of_exhibits[exhibit] << patron
      end

    end
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
