require 'test_helper'

class HowItWorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get how_it_works_index_url
    assert_response :success
  end

end
