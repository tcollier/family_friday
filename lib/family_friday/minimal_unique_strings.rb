require 'abbrev'

module FamilyFriday
  # Utility class to find the minimal unique strings for a given set of strings.
  module MinimalUniqueStrings
    # @param strings [Array<String>] the set of strings
    # @return [Hash<Stirng, String>] a hash mapping the input strings to its
    #   minimal unique string.
    def self.map(strings)
      Abbrev.abbrev(strings).map.with_object({}) do |(abbrev, string), hash|
        if !hash.key?(string) || abbrev.length < hash[string].length
          hash[string] = abbrev
        end
      end
    end
  end

  private_constant :MinimalUniqueStrings
end
