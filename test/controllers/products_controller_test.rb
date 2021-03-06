require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  fixtures :products

  setup do
    @product = products(:one)
    @update = {
    :title     => 'Lorem Ipsum',
    :description => 'Wibbles are fun!',
    :image_url    => 'lorem.jpg',
    :price    => 19.95
    }
 end

  test "should get index" do
    get :index
    assert_response :success
    # assert_select '#columns #side a', :minimum => 4
    # assert_select '#main .entry', 3
    # assert_select '.price', /\$[,\d]+\.\d\d/
    assert_select '#product_list .list_description dt', 'Programming Ruby 1.9'
    assert_select 'h1', 'Listing products'
    assert_select 'title', 'Pragprog Books Online Store'
    # assert_select '#main a', 'New Product'

  end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => @update
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should update product" do
    put :update, :id => @product.to_param, :product => @update
    assert_redirected_to product_path(assigns(:product))
  end


end
