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
  end
end




=begin
As a visitor,
When I visit `/comedians`
Then I also see the average age for all comedians.

=end