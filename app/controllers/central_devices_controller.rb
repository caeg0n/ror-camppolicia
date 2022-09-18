class CentralDevicesController < ApplicationController

  def is_registered?
    a = is_registered_params 
    b = CentralDevice.where(device_id:a["central_device"]).present?
    render json: { :is_registered => b.to_json }
  end

  def register_device
    a = central_device_params
    b = CentralDevice.where(device_id:a["central_device_id"]).present?
    c = CitizenDevice.where(device_id:a["citizen_device_id"]).present?
    if b 
      if c == false
        d = CitizenDevice.new
        d.device_id = a["citizen_device_id"]
        d.state = 1
        d.name = a["name"]
        d.cel = a["cel"]
        d.reference = a["reference"]
        d.save
        render json: { :status => "ok" }
      else
        render json: { :status => "erro" }
      end
    else
      render json: { :status => "erro" }
    end
  end


  private

    def is_registered_params
      params.permit(:central_device,:format)
    end

    def central_device_params
      params.permit(:central_device_id, :citizen_device_id,:name,:cel,:reference)
    end

end