module FamilyFriday
  class Grouper
    def initialize(items:)
      @items = items
    end

    # @return [Array<Array<Object>>] an array of groups of objects.
    def groups(seed: Random.new_seed)
      randomized = items.shuffle(random: Random.new(seed))
      groups = []
      while randomized.length > 6
        groups << randomized.shift(4)
      end
      if randomized.length > 5
        groups << randomized.shift(3)
      end

      groups << randomized
      groups
    end

    private

    attr_reader :items
  end
end
