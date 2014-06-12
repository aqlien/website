feature "Admins make new projects" do
  scenario "click the new project link" do
    sign_in_as_admin
    visit projects_path
    click_on "New Project"
    fill_in "project_name", with: "New project name"
    fill_in "project_technologies_used", with: projects(:portfolio).technologies_used
    fill_in "project_description", with: projects(:portfolio).description
    click_on "Create Project"
    page.must_have_content "Project was successfully created."
  end
end

feature "Admins can edit projects" do
  scenario "click the edit project link on the index page" do
    sign_in_as_admin
    visit projects_path
    within('.project', :text => projects(:old).name) {click_on "Edit"}
    fill_in "project_name", with: "Original project name"
    fill_in "project_technologies_used", with: projects(:portfolio).technologies_used
    fill_in "project_description", with: projects(:portfolio).description
    click_on "Update Project"
    page.must_have_content "Project was successfully updated."
    page.wont_have_content projects(:old).name
    page.must_have_content "Original project name"
    visit projects_path
    page.must_have_content "Original project name"
    page.wont_have_content projects(:old).name
  end
  scenario "click the edit project link on the project page" do
    sign_in_as_admin
    visit project_path(projects(:old))
    click_on "Edit"
    fill_in "project_name", with: "Original project name"
    fill_in "project_technologies_used", with: projects(:portfolio).technologies_used
    fill_in "project_description", with: projects(:portfolio).description
    click_on "Update Project"
    page.must_have_content "Project was successfully updated."
    page.wont_have_content projects(:old).name
    page.must_have_content "Original project name"
    visit projects_path
    page.must_have_content "Original project name"
    page.wont_have_content projects(:old).name
  end
end

feature "Admins can delete projects" do
  scenario "click the delete project link on the index page" do
    sign_in_as_admin
    visit projects_path
    within('.project', :text => projects(:old).name) {click_on "Destroy"}
    page.must_have_content "Project was successfully destroyed."
    page.wont_have_content projects(:old).name
  end
  scenario "click the delete project link on the project page" do
    sign_in_as_admin
    visit project_path(projects(:old))
    click_on "Destroy"
    page.must_have_content "Project was successfully destroyed."
    page.wont_have_content projects(:old).name
    visit projects_path
    page.wont_have_content projects(:old).name
  end
end
