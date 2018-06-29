describe "visitor" do
  context "visits comedian index page" do
    it "and sees a list of comedians with Name and Age" do
      comedian = Comedian.new(name: "Eddie Murphy", age: 55)

      visit '/'

      expect(page).to have_content(comedian.name) 
      expect(page).to have_content(comedian.age) 
    end
  end
end




=begin
As a visitor,
When I visit `/comedians`
Then I see a list of comedians with the following
information for each comedian:
  * Name
  * Age

=end