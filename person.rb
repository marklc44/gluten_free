require_relative "./allergyError.rb"

class Person

  attr_reader :name, :gender
  attr_accessor :stomach, :allergies

  def initialize(name, gender, allergies)
    @name = name
    @gender = gender
    @stomach = []
    @allergies = allergies
  end

  def eat(foods)

    contains_allergy = false
    foods.each do |food|
      if @allergies.index(food) != nil
        contains_allergy = true
      end
    end
    if contains_allergy
      throw_allergy_error
    else
      @stomach.push(foods)
    end
  end

  private
    def throw_allergy_error
      # do real error handling here
      # instead of puts
      begin
        raise AllergyError.new({e: "thing"}), "Allergy Error! You're going to throw up!"
      rescue AllergyError => e
        puts e.message
      end
      # puts "Don't eat that!!!"
      @stomach = []
    end
end



john = Person.new("John", "Male", ["shrimp", "peanuts", "milk", "gluten", "scallops"])

pizza = ["milk", "sausage", "sauce", "gluten"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
gluten_free_icecream = ["coconut milk", "cocoa"]

p john.stomach
john.eat(pizza)
john.eat(pan_seared_scallops)
john.eat(gluten_free_icecream)
p john.stomach
