require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Example User', email: 'abc@gmail.com',
                        password: Devise::Encryptor.digest(User, 'helloworld'))
    Food.create(name: 'Example Food', measurement_unit: 'g', price: 0, user_id: @user.id)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with excessively long name' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
end
