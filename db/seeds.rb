# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all

products = [
  {
    name: 'Laptop',
    description: 'High-performance laptop with the latest processor and ample storage.',
    price: 999.99,
    available: true
  },
  {
    name: 'Smartphone',
    description: 'Latest smartphone model with advanced camera capabilities.',
    price: 699.99,
    available: true
  },
  {
    name: 'Headphones',
    description: 'Noise-cancelling wireless headphones with long battery life.',
    price: 199.99,
    available: false
  },
  {
    name: 'Smartwatch',
    description: 'Track your fitness and stay connected with this sleek smartwatch.',
    price: 249.99,
    available: true
  },
  {
    name: 'Tablet',
    description: 'Portable tablet perfect for entertainment and productivity.',
    price: 399.99,
    available: false
  }
]

products.each do |product_data|
  Product.create!(product_data)
end

puts "Created #{Product.count} products"
