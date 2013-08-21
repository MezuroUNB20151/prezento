Given(/^I am at the All Projects page$/) do
  visit projects_path
end

Given(/^I have a sample project$/) do
  @project = FactoryGirl.create(:project, {id: nil})
end

Given(/^I am at the Sample Project page$/) do
  visit project_path(@project.id)
end

Given(/^I am at the sample project edit page$/) do
  visit edit_project_path(@project.id)
end

Then(/^I should not see (.+)$/) do |text|
  page.should_not have_content(text)
end

Then(/^the sample project should be there$/) do
  page.should have_content(@project.name)
  page.should have_content(@project.description)
end

Then(/^I should be in the All Projects page$/) do
  page.should have_content("Listing Projects")
end

Then(/^I should be in the Edit Project page$/) do
  page.should have_content("Edit Project")
end

Then(/^The field "(.*?)" should be filled with the sample project "(.*?)"$/) do |field, value|
  page.find_field(field).value.should eq(@project.send(value))
end
