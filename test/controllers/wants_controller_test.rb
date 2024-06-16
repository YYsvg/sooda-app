require 'test_helper'

class WantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new,edit,create,update,destroy" do
    get wants_new,edit,create,update,destroy_url
    assert_response :success
  end

end
