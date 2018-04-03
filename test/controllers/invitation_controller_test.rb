require 'test_helper'

class InvitationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invitation_index_url
    assert_response :success
  end

end
