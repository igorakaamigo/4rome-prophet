require 'rails_helper'

feature 'Getting a result list', type: :feature do
  scenario 'after request list submission' do
    visit('/')

    fill_in(I18n.t('requests'), with: "first request\nsecond request\nthird request")
    click_button(I18n.t('next'))

    expect(page).to have_css('img', count: 3)
    expect(page).to have_css('img[alt="first request"]', count: 1)
    expect(page).to have_css('img[alt="second request"]', count: 1)
    expect(page).to have_css('img[alt="third request"]', count: 1)

    check('first request')
    check('third request')
    click_button(I18n.t('next'))

    expect(page).to have_css('textarea', exact_text: 'first request third request')
    expect(page.current_path).to eq('/')
  end
end
