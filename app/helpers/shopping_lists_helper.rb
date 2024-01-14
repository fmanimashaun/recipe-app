module ShoppingListsHelper
  def calculate_missing_foods(recipes, available_foods)
    missing_foods = []
    total_missing_items = 0
    total_price = 0

    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food_name = recipe_food.food.name
        required_quantity = recipe_food.quantity

        available_food = available_foods.find { |food| food.name == food_name }

        if available_food
          available_quantity = available_food.quantity
          missing_quantity = [required_quantity - available_quantity, 0].max

          if missing_quantity.positive?
            missing_foods << {
              name: food_name,
              quantity: missing_quantity,
              price: available_food.price # Assuming price is in the Food model
            }
            total_missing_items += 1
            total_price += missing_quantity * available_food.price
          end
        else
          missing_foods << {
            name: food_name,
            quantity: required_quantity,
            price: recipe_food.food.price # If price is not in the Food model
          }
          total_missing_items += 1
          total_price += required_quantity * recipe_food.food.price
        end
      end
    end

    [missing_foods, total_missing_items, total_price]
  end
end
