# Usage: rails db:seed or created alongside the database with rails db:setup

user = User.create! :name => 'Test', :email => 'test@test.com', :password => 'testtest', :password_confirmation => 'testtest', :admin => true

# CSS
Category.create(name: "Properties")
Category.create(name: "Functions")
Category.create(name: "Elements")
Category.create(name: "Classes")

# JavaScript
Category.create(name: "JavasScript Functions")
Category.create(name: "JavaScript Classes")
Category.create(name: "Objects")
Category.create(name: "Another")

# Ruby
Category.create(name: "Ruby Example Category")
Category.create(name: "Ruby Example Category 2")
Category.create(name: "Ruby Example Category 3")
Category.create(name: "Ruby Example Category 4")
Category.create(name: "Ruby Example Category 5")

# Python
Category.create(name: "Python Example Category")
Category.create(name: "Python Example Category 2")
Category.create(name: "Python Example Category 3")
Category.create(name: "Python Example Category 4")
Category.create(name: "Python Example Category 5")