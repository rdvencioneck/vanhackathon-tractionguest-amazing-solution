require 'test_helper'

class SearchsControllerTest < ActionDispatch::IntegrationTest
  # Testing the creation of a new search

  test "should return an error of Unauthorized if it was send the wrong token" do
    # 401
  end

  test "should return an error if it was send no plate to research" do
    # 400
  end

  test "should return no content if there is no content to be found for that plate" do
    # 204
  end

  test "should return an success if the search is done and they found information about the plate" do
    # 200
  end
end
