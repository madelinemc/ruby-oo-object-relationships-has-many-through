class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0) #allows instance of Waiter class to create a new instance of Meal. set themselves as the waiter. This is the same as the customer new_meal method as the arugemnts remain the same, just the parameters are different(the self is in the corresponding spot for each class)
        Meal.new(self, customer, total, tip)
    end

    def meals #iterates over the meal class and selcts the meal instances that correspond to this waiter instance
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper #uses meals method and allows waiter instance to access info from meal class and therefore from customer class thru meal class. 
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end

end