require "test_helper"

feature "Visitors can't make new projects" do
  scenario "cannot see new project link" do
    visit projects_path
    page.wont_have_content "New Project"
  end
  scenario "cannot use URL hacking to make project" do
    visit new_project_path
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

feature "Visitors can't edit projects" do
  scenario "cannot see edit project link" do
    visit projects_path
    page.wont_have_content "Edit"
    visit project_path(projects(:portfolio))
    page.wont_have_content "Edit"
  end
  scenario "cannot use URL hacking to edit" do
    visit edit_project_path(projects(:portfolio))
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

feature "Visitors can't destroy projects" do
  scenario "cannot see destroy project link" do
    visit projects_path
    page.wont_have_content "Destroy"
    visit project_path(projects(:portfolio))
    page.wont_have_content "Destroy"
  end
  scenario "cannot use URL hacking to delete" do
    page.driver.submit :delete, "/projects/#{projects(:portfolio).id}", {}
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

