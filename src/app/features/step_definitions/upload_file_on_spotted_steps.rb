When("I upload an image to the spotted") do
    page.attach_file "spotted[image]", Rails.root.join('features', 'images', 'cat_and_dog.jpg')
end

When("I go to spotted page") do
    @spotted = Spotted.find_by(content: "Spotted Teste")
    visit("/colleges/college_id/spotteds/#{@spotted.id}")
end

Then("I should my see my image attached") do
    find('#image')
end