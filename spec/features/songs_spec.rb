require 'spec_helper'

feature 'User can add song' do
  scenario 'User can add songs and see them listed on the song homepage' do
    song_title = 'Classixx - \'Hanging Gardens\' LP (Full Album Stream)'
    song_url = 'https://www.youtube.com/watch?v=2GJ4ti_SMu4'
    visit '/'
    click_on 'Song Manager'
    click_on 'Add Song'
    fill_in 'Title', with: song_title
    fill_in 'Url', with: song_url
    click_on 'Queue the Fabulousness'
    expect(page).to have_content(song_title)
  end
end

feature 'User can manage existing songs' do
  let!(:song_title) {$song_title = 'Classixx - \'Hanging Gardens\' LP (Full Album Stream)'}
  let!(:song_url) {$song_url = 'https://www.youtube.com/watch?v=2GJ4ti_SMu4'}

  before do
    visit '/'
    click_on 'Song Manager'
    click_on 'Add Song'
    fill_in 'Title', with: song_title
    fill_in 'Url', with: song_url
    click_on 'Queue the Fabulousness'
  end

  scenario 'User can see the song\'s show page' do
    click_on song_title
    expect(page).to have_content song_title
    expect(page).to_not have_content('Add Song')
  end

  scenario 'User can edit the song' do
    click_on song_title
    click_on 'Edit'
    fill_in 'Title', with: 'Classixx - Hanging Gardens full album'
    click_on 'Update'
    expect(page).to_not have_content(song_title)
    expect(page).to have_content('Classixx - Hanging Gardens full album')
  end

  scenario 'User can delete the song' do
    click_on song_title
    click_on 'Delete'
    expect(page).to_not have_content(song_title)
  end

end
