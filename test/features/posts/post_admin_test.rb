require "test_helper"

def sign_in
  click_on "Sign In"
end

feature "Admins make new posts" do
  scenario "click the new post link" do
    visit posts_path
    click_on "New Post"
    fill_in "title", with: posts(:ap).title
    fill_in "body", with: posts(:ap).body
    check "post_published"
    click_on "Create Post"
    page.must_have_content "Post was successfully created."
  end
end

feature "Admins can edit posts" do
  scenario "click the edit post link on the index page" do
    visit posts_path
    page.find('tr', :text => posts(:lp).title).click_on "Edit"
    fill_in "title", with: posts(:ap).title
    fill_in "body", with: posts(:ap).body
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
    visit posts_path(posts(:lp))
    click_on "Edit"
    fill_in "title", with: posts(:ap).title
    fill_in "body", with: posts(:ap).body
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
    visit posts_path
    page.find('tr', :text => posts(:lp).title).click_on "Destroy"
    page.must_have_content "Post was successfully destroyed."
    page.wont_have_content posts(:lp).title
  end
  scenario "click the delete post link on the post page" do
    visit posts_path(posts(:lp))
    click_on "Destroy"
    page.must_have_content "Post was successfully destroyed."
    page.wont_have_content posts(:lp).title
    visit posts_path
    page.wont_have_content posts(:lp).title
  end
end

feature "Admins can see unpublished posts" do
  scenario "index page shows unpublished posts" do
    visit posts_path
    page.must_have_content posts(:up).title
  end
  scenario "Admins can publish posts" do
    visit posts_path(:up)
    click_on "Edit"
    check "post_published"
    click_on "Update Post"
    click_on "Sign Out"
    page.must_have_content "signed out"
    visit posts_path
    page.must_have_content posts(:up).title
  end
end
