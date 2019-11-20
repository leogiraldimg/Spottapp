Then(/^The college page shouldn't be exist anymore$/) do
    expect(page).not_to have_link('Editar', href: '/colleges/#{@college.id}/edit')
end