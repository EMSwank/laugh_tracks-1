describe "visitor" do
  context "visits comedian index page" do
    it "and sees a list of comedians with Name and Age" do
      comedian = Comedian.create(name: "Eddie Murphy", age: 55)

      visit '/comedians'

      expect(page).to have_content(comedian.name) 
      expect(page).to have_content(comedian.age) 
    end

    it "and sees a list of comedian specials" do
      comedian = Comedian.create(name: "Eddie Murphy", age: 55)
      special = Special.create(name: "Delirious", comedian_id: comedian.id)

      visit '/comedians'

      expect(page).to have_content(special.name) 
    end

    it "and sees the average age of all comedians" do
      comedian1 = Comedian.create(name: "Eddie Murphy", age: 50)
      comedian2 = Comedian.create(name: "Seth Rogan", age: 40)
      average_age = 45
      visit '/comedians'

      expect(page).to have_content(average_age) 
    end
    it "and sees a list of all comedians with an age of 34." do
      comedian1 = Comedian.create(name: "Carrot Top", age: 50)
      comedian2 = Comedian.create(name: "Seth Rogan", age: 34)

      visit '/comedians?age=34'

      expect(page).to_not have_content(comedian1.name) 
      expect(page).to have_content(comedian2.name) 
    end
  end
end




=begin
As a visitor,
when I visit `/comedians?age=34`
Then I see a list of all comedians with an age of 34.

=end