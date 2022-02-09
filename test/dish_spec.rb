require './lib/dish'
require './lib/potluck'
require 'pry'

RSpec.describe Dish do
  it "creates an instance of class Dish" do
    dish = Dish.new("Couscous Salad", :appetizer)

    expect(dish).to be_an_instance_of(Dish)
  end

  it "has correct name variable" do
    dish = Dish.new("Couscous Salad", :appetizer)

    expect(dish.name).to eq("Couscous Salad")
  end

  it "has correct category variable" do
    dish = Dish.new("Couscous Salad", :appetizer)

    expect(dish.category).to eq(:appetizer)
  end

  it "creates an instance of Potluck class" do
    potluck = Potluck.new("7-13-18")

    expect(potluck).to be_an_instance_of(Potluck)
  end

  it "has correct date variable" do
    potluck = Potluck.new("7-13-18")

    expect(potluck.date).to eq("7-13-18")
  end

  it "has creates dishes variable as empty array" do
    potluck = Potluck.new("7-13-18")

    expect(potluck.dishes).to eq([])
  end

  it "adds dishes to the empty dishes array" do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    potluck = Potluck.new("7-13-18")

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
  end

  it "confirms there are two dishes in the dishes array" do
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    potluck = Potluck.new("7-13-18")

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    expect(potluck.dishes.length).to eq(2)
  end

  it "returns only appetizers from the dishes array" do
    potluck = Potluck.new("7-13-18")

    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
    expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
    expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
  end

  it "returns a menu hash arranged by category" do
    potluck = Potluck.new("7-13-18")

    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    expect(potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"], :entres=>["Cocktail Meatballs", "Roast Pork"], :desserts=>["Candy Salad"]})
  end

  it "returns the ratio of appetizers on the menu" do
    potluck = Potluck.new("7-13-18")

    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    expect(potluck.ratio(:appetizer)).to eq(50.0)
  end
end
