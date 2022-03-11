require 'rails_helper'

RSpec.describe ProjectUser, type: :model do
  
  let!(:user) {User.create(user_name: 'jithesh', password: 'poshvine', mobile: '8838737309', email: 'jithu@gmail.com')}
  let!(:project) {Project.create(name: 'test')}

  subject {
    described_class.new(user_id: user.id, project_id: project.id)
  }

  describe 'association validation' do
    context 'testing project_user association' do
      it 'is valid record' do
        expect(subject).to be_valid
      end

      it 'validates association' do
        puts "#{subject.inspect}"
        should belong_to(:user)
      end 
    end
  end
end
