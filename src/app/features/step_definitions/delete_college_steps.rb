Then(/^The college page shouldn't be exist anymore$/) do
    expect(page).not_to have_link('Editar', href: '/colleges/#{@college.id}/edit')
end

Then(/^I cant find that college Editar button$/) do
    element = find('.summary', text: 'UT002 - Faculdade Teste 002')
    expect(element).not_to have_link('Editar')
end