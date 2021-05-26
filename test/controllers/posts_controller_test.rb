require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'can get index' do
    get api_v1_posts_path
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal('String1', res[0]['title'])
  end

  test 'can get show' do
    get api_v1_post_path(posts(:one).id)
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal('String1', res['title'])
  end

  test 'can create' do
    params = { title: 'testtitle', body: 'testbody' }
    post api_v1_posts_path(params)
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal(Post.last.id, res)
  end

  test 'can invalid create' do
    params = { title: '', body: '' }
    post api_v1_posts_path(params)
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal(["Title can't be blank", "Body can't be blank"], res)
  end

  test 'can update' do
    params = { id: posts(:one).id, title: 'testtitle', body: 'testbody' }
    patch api_v1_post_path(params)
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal(posts(:one).id, res)
  end

  test 'can invalid update' do
    params = { id: posts(:one).id, title: '', body: '' }
    patch api_v1_post_path(params)
    assert_response :success
    res = JSON.parse(response.body)
    assert_equal(["Title can't be blank", "Body can't be blank"], res)
  end

  test 'can get destroy' do
    delete api_v1_post_path(posts(:one).id)
    assert_response :success
    assert_equal(204, response.status)
  end
end
