module Pseudonymize
  class Telephone
    attr_reader :options
    
    def initialize(telephone, **options)
      @telephone = telephone
      @options   = options
    end
    
    def result
      characters = @telephone.chars
      unhidden   = (characters.length / 2)
      last       = (unhidden.to_f / 2).ceil
      first      = unhidden - last
      
      [
        characters[0..first],
        (options[:censor] * (characters.length - first - last - 1)),
        characters[-last, last]
      ].flatten.join
    end
  end
end
