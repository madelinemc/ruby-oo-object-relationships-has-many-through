class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0) #this method creates new meals as a customer and automatically associates each new meal with the customer that created it. 
        Meal.new(waiter, self, total, tip)
    end

    def meals #customer looks at all of the meals and selects the ones that belong to them
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters #uses meals method which selects all the meals that belong to the customer instane and then further iterates over just those meals to return who the waiter is.
        meals.map do |meal|
            meal.waiter
        end
    end


    
end