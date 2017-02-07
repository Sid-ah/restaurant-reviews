User.create(username: "kane", email: "kane@gmail.com", password:'password')

User.last.restaurants.create(name: "Sullivan Bistro", cuisine: "American", street: "Sullivan St", city: "New York", state: 'NY', zip:'10010')

User.last.restaurants.create(name: "Asian Wok", cuisine: "Chinese", street: "Asian Wok", city: "New York", state: 'NY', zip:'10010')

User.last.restaurants.create(name: "Moulin Rouge", cuisine: "French", street: "Asian Wok", city: "New York", state: 'NY', zip:'10010')
