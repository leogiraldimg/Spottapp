When("I upload an image to the spotted") do
    page.attach_file "spotted[images][]", Rails.root.join('features', 'images', 'cat_and_dog.jpg')
end

When("I go to spotted page") do
    visit("/colleges/college_id/spotteds/1")
end

Then("I should my see my image attached") do
    find('#image')
end