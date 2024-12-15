require "test_helper"

class AtendentesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get atendentes_new_url
    assert_response :success
  end

  test "should get create" do
    get atendentes_create_url
    assert_response :success
  end
end
