RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe "Class methods" do
    it ".average_age" do
      comedian1 = Comedian.create(name: "Eddie Murphy", age: 50)
      comedian2 = Comedian.create(name: "Seth Rogan", age: 40)
      average_age = 45

      expect(Comedian.average_age).to eq(average_age)
    end
    
  end
  
end
