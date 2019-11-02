When(/^I click the Apagar a página button$/) do
    # page.evaluate_script('window.confirm = function() { return true; }')
    find('.delete-button').click
end

Then(/^The college page shouldn't be exist anymore$/) do
    expect(page).not_to have_link('Editar', href: '/colleges/#{@college.id}/edit')
end