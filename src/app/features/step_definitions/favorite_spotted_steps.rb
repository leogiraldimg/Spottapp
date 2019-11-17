Given(/^I click on Ativar Notificações/) do
    find('a.dropdown-toggle2').click # assuming you only have one a.dropdown-toggle
    click_on 'ativar-not'
end