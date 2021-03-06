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
      special = comedian.specials.create(name: "Delirious")

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

    it "and sees a count of specials for each comedian." do
      comedian = Comedian.create(name: "Carrot Top", age: 50)
      special1 = comedian.specials.create(name: "Delirious")
      special2 = comedian.specials.create(name: "fghj")
      expected_result = 2

      visit '/comedians'

      expect(page).to have_content("Number of Specials: #{expected_result}")
    end
  end
end