require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it "shows all snacks and their price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: "Cheetos", price: 20)
    snack_2 = Snack.create(name: "Twix", price: 40)

    visit machine_path(dons)
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content("#{snack_1.name}: #{snack_1.price}")
    expect(page).to have_content("#{snack_2.name}: #{snack_2.price}")
  end
  it "shows average price for all snacks in machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: "Cheetos", price: 20)
    snack_2 = Snack.create(name: "Twix", price: 40)

    visit machine_path(dons)

    expect(page).to have_content("Average Snack price: #{@snacks_avg}")
  end
end
