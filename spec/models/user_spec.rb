require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Example User', email: 'abc@gmail.com') }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate email address' do
    new_user = User.create(name: 'Josh', email: subject.email)
    expect(new_user).to_not be_valid
  end
end
