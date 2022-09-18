require 'test_helper'

class CitizenDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citizen_device = citizen_devices(:one)
  end

  test "should get index" do
    get citizen_devices_url, as: :json
    assert_response :success
  end

  test "should create citizen_device" do
    assert_difference('CitizenDevice.count') do
      post citizen_devices_url, params: { citizen_device: { cel: @citizen_device.cel, device_id: @citizen_device.device_id, nick: @citizen_device.nick, state: @citizen_device.state } }, as: :json
    end

    assert_response 201
  end

  test "should show citizen_device" do
    get citizen_device_url(@citizen_device), as: :json
    assert_response :success
  end

  test "should update citizen_device" do
    patch citizen_device_url(@citizen_device), params: { citizen_device: { cel: @citizen_device.cel, device_id: @citizen_device.device_id, nick: @citizen_device.nick, state: @citizen_device.state } }, as: :json
    assert_response 200
  end

  test "should destroy citizen_device" do
    assert_difference('CitizenDevice.count', -1) do
      delete citizen_device_url(@citizen_device), as: :json
    end

    assert_response 204
  end
end
