Given("I am on the edit user page") do
    visit edit_user_path(@user.id)
end

When("I fill the username with a new username information") do
    fill_in "user[nickname]", with: "new_nickname"
end

When("I fill the passwords fields") do
    fill_in "user[password]", with: "teste001user"
    fill_in "user[password_confirmation]", with: "teste001user"
end