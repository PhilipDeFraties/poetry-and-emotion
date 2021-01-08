require 'rails_helper'

describe "User can search for poems" do
  it "and sees a list of 10 poems with tone or tones listed for each" do
    visit '/'

    fill_in 'author', with: 'Emily'
    click_on 'Get Poems'

    expect(current_path).to eq('/search')
    expect(page).to have_css('.poem', count: 10)

    within(first('.poem')) do
           within('.title') do
               expect(page).to have_content('Title: Not at Home to Callers')
           end
           within('.author') do
               expect(page).to have_content("Author: Emily Dickinson")
           end
           within('.analysis') do
               expect(page).to have_content('Joy')
           end
         end
  end
end
