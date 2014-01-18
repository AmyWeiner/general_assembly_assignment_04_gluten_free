# Defines the Person class. An instance of this class must have a name,
# and can have none or more allergies. A person object can also eat a
# defined meal containing one or more explicit food items. If the person
# object is allergic to any one of the food items in the meal
class Person
  attr_reader :name, :allergies

  def initialize(name, allergies=[])
    @name = name
	@allergies = allergies
  end

  def eat(meal, allergies=@allergies)
    puts "#{@name} is currently eating a meal containing..."
	meal.each { |item| print "#{item}..."}
	puts ""
	begin
	  @allergies.each do |allergy|
	    if meal.include?(allergy)
	      raise AllergyError.new("#{@name} is allergic to #{allergy}.")
	    end
	  end
	rescue
	  puts "#{@name} is allergic to #{@allergies} and vomits."
	  puts ""
	end
  end
end

# Creates custom error for exception handling
class AllergyError < ArgumentError; end

# Creates a Person named Chris, who is allergic to gluten.
chris = Person.new("Chris", ["gluten"])

# Creates a Person named Beth, who is allergic to scallops.
beth = Person.new("Beth", ["scallops"])

# meals containing various food items
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# Feeds Chris pizza, scallops, and water.
chris.eat(pizza)
chris.eat(pan_seared_scallops)
chris.eat(water)

puts ""

# Feeds Beth pizza, scallops, and water.
beth.eat(pizza)
beth.eat(pan_seared_scallops)
beth.eat(water)