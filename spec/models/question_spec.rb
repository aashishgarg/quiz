require 'rails_helper'

RSpec.describe Question, type: :model do
  context '#Validations' do
    context '#Decsription' do
      before(:each) do
        @question = Question.new
      end

      it 'validates presence of description' do
        expect(@question.valid?).to eq(false)
        expect(@question.errors.key?(:description)).to eq(true)
        expect(@question.errors[:description].include?("can't be blank")).to eq(true)
      end

      it 'validates length of description' do
        @question.valid?
        expect(@question.errors[:description].include?("is too short (minimum is 5 characters)")).to eq(true)
      end
    end

    context '#Options' do
      it 'validates presence of minimum 2 options' do
        question = FactoryBot.build(:question, options_attributes: [{description: 'sdfsdf'}])
        expect(question.valid?).to eq(false)
        expect(question.errors.key?(:options)).to eq(true)
        expect(question.errors[:options].include?('should be between 2 and 4')).to eq(true)
      end

      it 'validates presence of maximum 4 options' do
        question = FactoryBot.build(:question, options_attributes: [
            {description: '00000'},
            {description: '11111'},
            {description: '22222'},
            {description: '33333'},
            {description: '44444'}
        ])
        expect(question.valid?).to eq(false)
        expect(question.errors.key?(:options)).to eq(true)
        expect(question.errors[:options].include?('should be between 2 and 4')).to eq(true)
      end
    end
  end
end
