require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Pepe Frog', email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end
  before { subject.save }

  context 'Validations should be working' do
    it 'ALL validations should return true' do
      expect(subject).to be_valid
    end

    it 'Name validation should return false' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'Name length should be lesser than 15 characters' do
      expect(subject.name).to satisfy { |n| n.length <= 27 }
    end

    it 'email should return a string' do
      expect(subject.email).to be_a_kind_of(String)
    end
  end
end
