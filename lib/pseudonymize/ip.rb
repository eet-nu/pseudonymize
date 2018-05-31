module Pseudonymize
  class Ip
    attr_reader :options
    
    def initialize(ip, **options)
      @ip      = ip
      @options = options
    end
    
    def result
      first = @ip.split('.')[0..-2].join('.')
      "#{first}.#{options[:censor] * 3}"
    end
  end
end
