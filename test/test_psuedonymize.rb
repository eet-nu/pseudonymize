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
    
    describe 'with an ip' do
      it 'pseudonymizes the ip but preserves the first 3 octets' do
        pseudonymize('1.2.3.4', type: :ip).must_equal '1.2.3.•••'
      end
    end
    
    describe 'with an empty email' do
      it 'returns an empty string when an empty string is passed' do
        pseudonymize('', type: :email).must_equal ''
      end
    end
    
    describe 'with an empty name' do
      it 'returns an empty string when an empty string is passed' do
        pseudonymize('', type: :name).must_equal ''
      end
    end
    
    describe 'with an empty phone number' do
      it 'returns an empty string when an empty string is passed' do
        pseudonymize('', type: :telephone).must_equal ''
      end
    end
    
    describe 'with an empty ip' do
      it 'returns an empty string when an empty string is passed' do
        pseudonymize('', type: :ip).must_equal ''
      end
    end
    
    describe 'with a nil object' do
      it 'returns nil when a nil object is passed' do
        assert_nil(pseudonymize(nil, type: :telephone))
      end
    end
  end
end
