require "test_helper"

feature "Admins make new posts" do
  scenario "click the new post link" do
    sign_in_as_admin
    visit posts_path
    click_on "New Post"
    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    check "post_published"
    click_on "Create Post"
    page.must_have_content "Post was successfully created."
  end
end

feature "Admins can edit posts" do
  scenario "click the edit post link on the index page" do
    sign_in_as_admin
    visit posts_path
    within('tr', :text => posts(:lp).title) {click_on "Edit"}
    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    check "post_published"
    click_on "Update Post"
    page.must_have_content "Post was successfully updated."
    page.wont_have_content posts(:lp).title
    page.must_have_content posts(:ap).title
    visit posts_path
    page.must_have_content posts(:ap).title
    page.wont_have_content posts(:lp).title
  end
  scenario "click the edit post link on the post page" do
    sign_in_as_admin
    visit post_path(posts(:lp))
    click_on "Edit"
    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    check "post_published"
    click_on "Update Post"
    page.must_have_content "Post was successfully updated."
    page.wont_have_content posts(:lp).title
    page.must_have_content posts(:ap).title
    visit posts_path
    page.must_have_content posts(:ap).title
    page.wont_have_content posts(:lp).title
  end
end

feature "Admins can delete posts" do
  scenario "click the delete post link on the index page" do
    sign_in_as_admin
    visit posts_path
    within('tr', :text => posts(:lp).title) {click_on "Destroy"}
    page.must_have_content "Post was successfully destroyed."
    page.wont_have_content posts(:lp).title
  end
  scenario "click the delete post link on the post page" do
    sign_in_as_admin
    visit post_path(posts(:lp))
    click_on "Destroy"
    page.must_have_content "Post was successfully destroyed."
    page.wont_have_content posts(:lp).title
    visit posts_path
    page.wont_have_content posts(:lp).title
  end
end

feature "Admins can see unpublished posts" do
  scenario "index page shows unpublished posts" do
    sign_in_as_admin
    visit posts_path
    page.must_have_content posts(:up).title
  end
  scenario "Admins can publish posts" do
    sign_in_as_admin
    visit post_path(posts(:up))
    click_on "Edit"
    check "post_published"
    click_on "Update Post"
    click_on "Log Out"
    page.must_have_content "Signed out successfully"
    visit posts_path
    page.must_have_content posts(:up).title
  end
end
