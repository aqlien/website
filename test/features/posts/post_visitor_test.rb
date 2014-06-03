require "test_helper"

feature "Visitors can't make new posts" do
  scenario "cannot see new post link" do
    visit posts_path
    page.wont_have_content "New Post"
  end
  scenario "cannot use URL hacking to post" do
    visit new_post_path
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

feature "Visitors can't edit posts" do
  scenario "cannot see edit post link" do
    visit posts_path
    page.wont_have_content "Edit"
    visit post_path(posts(:ap))
    page.wont_have_content "Edit"
  end
  scenario "cannot use URL hacking to edit" do
    visit edit_post_path(posts(:ap))
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

feature "Visitors can't destroy posts" do
  scenario "cannot see destroy post link" do
    visit posts_path
    page.wont_have_content "Destroy"
    visit post_path(posts(:ap))
    page.wont_have_content "Destroy"
  end
  scenario "cannot use URL hacking to delete" do
    page.driver.submit :delete, "/posts/#{posts(:ap).id}", {}
    page.must_have_content I18n.t("devise.failure.unauthenticated")
  end
end

feature "Visitors cannot see unpublished posts" do
  scenario "index page doesn't show unpublished posts" do
    visit posts_path
    page.must_have_content posts(:ap).title
    page.wont_have_content posts(:up).title
  end
end
