require 'spec_helper'

describe "Friendly Forwardings" do

  it "should forward to the requested page after signin" do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    # The test automatically follows the redirect to the signin page.
    fill_in "session[email]",    :with => user.email
    fill_in "session[password]", :with => user.password
    click_button "Login"
    # The test follows the redirect again, this time to users/edit.
    #save_and_open_page
    page.has_selector?('title', "Real Time Dashboard | User User Name")
  end
end

