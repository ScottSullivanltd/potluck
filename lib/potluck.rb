require './lib/dish'

class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
    # @get_all_from_category = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    get_all_from_category = []
    @dishes.each do |dish|
      if dish.category == :appetizer
        get_all_from_category << dish
      end
    end
    get_all_from_category
  end

  def menu
    menu = {}

  end

  def ratio(category)
    (get_all_from_category(:appetizer).length.to_f / dishes.length.to_f) * 100
  end
end
