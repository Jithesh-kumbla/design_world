require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(user_params) }
  
  describe 'Validation test cases' do
    context 'Valid and Invalid Test cases' do
      it 'is valid with attributes' do
        expect(subject).to be_valid
      end  

      it 'is not valid without password' do
        subject.password = nil
        expect(subject).not_to be_valid
      end
    end
  end

  def user_params
    {user_name: 'jithesh', password: 'poshvine', mobile: '8838737309', email: 'jithu@gmail.com'}
  end
end