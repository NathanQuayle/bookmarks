feature 'add bookmarks' do
  scenario 'user is able to add a bookmark and see it' do
    visit('/bookmarks')
    fill_in('add_url', with: 'www.fortnite.com')
    click_button('Submit')
    expect(page).to have_content('www.fortnite.com')
  end

  scenario 'user is NOT able to add a non-website bookmarks' do
    visit('/bookmarks')
    fill_in('add_url', with: 'appleCore')
    click_button('Submit')
    expect(page).to_not have_content('appleCore')
    expect(page).to have_content('Please enter a valid website!')
  end
end