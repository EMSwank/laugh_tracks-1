describe "visitor" do
  context "visits comedian index page" do
    it "and sees a list of comedians with Name and Age" do
      comedian = Comedian.create(name: "Eddie Murphy", age: 55)

      visit '/comedians'

      expect(page).to have_content(comedian.name) 
      expect(page).to have_content(comedian.age) 
    end

    it "and sees a list of comedians with Name and Age" do
      comedian = Comedian.create(name: "Eddie Murphy", age: 55)
      special = Special.create(name: "Delirious", comedian_id: comedian.id)

      visit '/comedians'

      expect(page).to have_content(special.name) 
    end
  end
end




=begin
As a visitor,
When I visit `/comedians`
Then I also see a list of each comedian's specials.

=end