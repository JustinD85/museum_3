class Patron
  attr_reader :name, :age, :spending_money, :interests

  def initialize(name, age)
    @name = name
    @age = age
    @spending_money = 20
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end
end
