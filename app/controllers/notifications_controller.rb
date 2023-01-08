class NotificationsController < ApplicationController

  def update_token
    valida_device_id = false
    valida_token = false
    valida_device_class = false

    device_id = update_token_params[:device_id]
    token = update_token_params[:token]
    device_class = update_token_params[:device_class]
    
    valida_device_id = true if not device_id.nil? and not device_id == ""
    valida_token = true if not token.nil? and not token == ""
    valida_device_class = true if not device_class.nil? and not device_class == "" and device_class > 0  

    if valida_device_id && valida_token && valida_device_class then
      exists = NotificationToken.where(device_id:device_id)
      if exists.count == 0 then
        notification_token = NotificationToken.new
        notification_token.device_id = device_id
        notification_token.token = token
        notification_token.device_class = device_class
        notification_token.save
      else
        notification = NotificationToken.find_by(device_id: device_id)
        notification.update(token: token)
      end
      render json: { :status => "ok" }
    else
      render json: { :status => "erro" }
    end
  end

  def send_emergency_message
    valida_device_id = false
    device_id = send_emergency_params[:device_id]
    valida_device_id = true if not device_id.nil? and not device_id == ""
    if valida_device_id then
      NotificationService.new().send_notification
    end
  end

  private

    # def send_emergency_message
    #   citizen_device_id =
    #   destiny_central_devices = NotificationTokens.select(:token).where(device_class:1).pluck(:token).compact
      
    #   send_message({organization:organization_name,to:admins,type:'organization_updated_token'}) if action_name == 'update_token'
    #   send_message({to:admins,type:'app_activity'}) if action_name == 'register'
    # end

    def update_token_params
      params.require(:notification).permit(:device_id,:token,:device_class)
    end
    
    def send_emergency_params
      params.require(:notification).permit(:device_id)
    end

end