
require 'rails_helper'

RSpec.describe Product, :type => :model do

  describe 'validations' do
    context 'when attributes exists' do

      subject { build(:product, name: 'test') }

      it 'does validate' do
        subject.valid?
        expect(subject.errors.blank?).to be_truthy
      end
    end
  end
end
