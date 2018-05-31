require 'minitest/autorun'
require 'pseudonymize'

describe Pseudonymize do
  describe '.pseudonymize' do
    def pseudonymize(*args)
      Pseudonymize.pseudonymize(*args)
    end
    
    describe 'with a name' do
      it 'pseudonymizes a European name' do
        pseudonymize('Tom-Eric Gerritsen', type: :name).must_equal 'T••••••• G••••••••'
      end
    end
    
    describe 'with an email address' do
      it 'pseudonomizes the email address but preserves the hostname' do
        pseudonymize('tomeric@eet.nu', type: :email).must_equal 't••••••@eet.nu'
      end
      
      it 'fully anonimizes the user part of the email address when it is too short' do
        pseudonymize('ik@tom-eric.info', type: :email).must_equal '••@tom-eric.info'
      end
    end
    
    describe 'with a telephone number' do
      it 'pseudonomizes the telephone number but preserves the first and last numbers' do
        pseudonymize('046-4007004', type: :telephone).must_equal '046•••••004'
      end
    end
  end
end
