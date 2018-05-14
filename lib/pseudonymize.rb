$LOAD_PATH << File.expand_path('../', __FILE__)

module Pseudonymize
  autoload :Email,     'pseudonymize/email'
  autoload :Name,      'pseudonymize/name'
  autoload :Telephone, 'pseudonymize/telephone'
  
  DEFAULT_OPTIONS = {
    censor: '█'
  }
  
  def self.pseudonymize(data, type:, **options)
    options = DEFAULT_OPTIONS.merge(options)
    
    case type
    when :email
      Email.new(data, **options).result
    when :name
      Name.new(data, **options).result
    when :telephone
      Telephone.new(data, **options).result
    end
  end
end
