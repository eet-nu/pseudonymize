module Pseudonymize
  class Email
    attr_reader :options
    
    def initialize(email, **options)
      @email   = email
      @options = options
    end
    
    def result
      user, host = @email.split('@')
      
      if user.length > 2
        user = user[0] + (options[:censor] * (user.length - 1))
      else
        user = (options[:censor] * user.length)
      end
      
      "#{user}@#{host}"
    end
  end
end
