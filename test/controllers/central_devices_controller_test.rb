require 'test_helper'

class CentralDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @central_device = central_devices(:one)
  end

  test "should get index" do
    get central_devices_url, as: :json
    assert_response :success
  end

  test "should create central_device" do
    assert_difference('CentralDevice.count') do
      post central_devices_url, params: { central_device: { device_id: @central_device.device_id, state: @central_device.state } }, as: :json
    end

    assert_response 201
  end

  test "should show central_device" do
    get central_device_url(@central_device), as: :json
    assert_response :success
  end

  test "should update central_device" do
    patch central_device_url(@central_device), params: { central_device: { device_id: @central_device.device_id, state: @central_device.state } }, as: :json
    assert_response 200
  end

  test "should destroy central_device" do
    assert_difference('CentralDevice.count', -1) do
      delete central_device_url(@central_device), as: :json
    end

    assert_response 204
  end
end
