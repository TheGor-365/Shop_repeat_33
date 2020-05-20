class AddProducts < ActiveRecord::Migration
  def change
    Product.create ({
      title: 'Huwaiian',
      description: 'This is Huwaiian pizza',
      price: 350,
      size: 30,
      is_spicy: false,
      is_veg: false,
      is_best_offer: false,
      path_to_image: 'images/pizza_hawaiian.jpg'
    })

    Product.create ({
      title: 'Pepperoni',
      description: 'This is Pepperoni pizza',
      price: 400,
      size: 30,
      is_spicy: true,
      is_veg: false,
      is_best_offer: false,
      path_to_image: 'images/pizza_pepperoni.jpg'
    })

    Product.create ({
      title: 'Vegetarian',
      description: 'This is Vegetarian pizza',
      price: 350,
      size: 30,
      is_spicy: false,
      is_veg: true,
      is_best_offer: false,
      path_to_image: 'images/pizza_vegetarian.jpg'
    })
  end
end
