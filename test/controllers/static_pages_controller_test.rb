require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'can get root' do
    get api_v1_root_path
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal('hello world !', res['message'])
  end
end
