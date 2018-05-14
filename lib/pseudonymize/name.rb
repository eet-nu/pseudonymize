module Pseudonymize
  class Name
    attr_reader :options
    
    def initialize(name, **options)
      @name    = name
      @options = options
    end
    
    def result
      @name.split.map do |name|
        "#{name[0].upcase}#{options[:censor] * (name.length - 1)}"
      end.join(' ')
    end
  end
end
