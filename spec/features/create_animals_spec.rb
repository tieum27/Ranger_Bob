require 'rails_helper'

RSpec.feature "CreateAnimals", type: :feature , js: true do
  context "Index Page" do
     Steps "for creating an animal" do
       Given "that I am on the index page" do
         visit "/"
       end
        Then "I can see all the animals that have been seen" do
          expect(page).to have_content 'Common name'
          expect(page).to have_content 'Latin name'
          expect(page).to have_content 'Kingdom'
        end
    end
  end
  context "New Animal" do
     Steps "for creating an animal" do
       Given "that I am on the New Animal page" do
         visit new_animal_path
       end
        Then "I can enter the animal informations" do
         fill_in 'animal_common_name', with: 'Test Common Name'
         fill_in 'animal_latin_name', with: 'Test Latin Name'
         fill_in 'animal_kingdom', with: 'Test Kingdom'
         click_button 'Create Animal'
        end
        Then "I can see all the animals that have been seen" do
          expect(page).to have_content 'Animal was successfully created.'
        end
        Then "I can view the animal informations" do
          visit root_path
          expect(page).to have_content 'Common name'
          expect(page).to have_content 'Latin name'
          expect(page).to have_content 'Kingdom'
          expect(page).to have_content 'Test Common Name'
          expect(page).to have_content 'Test Latin Name'
          expect(page).to have_content 'Test Kingdom'
        end
        Then "I can edit the animal" do
          visit '/animals/1/edit'
          expect(page).to have_content 'Editing Animal'
          fill_in 'animal_common_name', with: 'Update Name1'
          fill_in 'animal_latin_name', with: 'Update Latin 1'
          fill_in 'animal_kingdom', with: 'Update Kingdom1'
          click_button 'Update Animal'
        end
        Then "I can see all the animals that have been seen" do
          expect(page).to have_content 'Animal was successfully updated.'
          expect(page).to have_content 'Update Name1'
          expect(page).to have_content 'Update Latin 1'
          expect(page).to have_content 'Update Kingdom1'
        end
        Then "I can destroy the animal" do
          visit root_path
          first(:link, "Destroy").click
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content 'Animal was successfully destroyed.'
        end
    end
  end
end
