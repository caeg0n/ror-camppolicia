class CitizenDevicesController < ApplicationController
  #before_action :set_citizen_device, only: [:show, :update, :destroy]

  def is_registered?
    a = is_registered_params 
    b = CitizenDevice.where(device_id:a["citizen_device"]).present?
    render json: { :is_registered => b.to_json }
  end

  # def index
  #   @citizen_devices = CitizenDevice.all
  #   render json: @citizen_devices
  # end

  # def show
  #   render json: @citizen_device
  # end

  # def create
  #   @citizen_device = CitizenDevice.new(citizen_device_params)
  #   if @citizen_device.save
  #     render json: @citizen_device, status: :created, location: @citizen_device
  #   else
  #     render json: @citizen_device.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @citizen_device.update(citizen_device_params)
  #     render json: @citizen_device
  #   else
  #     render json: @citizen_device.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @citizen_device.destroy
  # end

  private
    # def set_citizen_device
    #   @citizen_device = CitizenDevice.find(params[:id])
    # end

    # def citizen_device_params
    #   params.require(:citizen_device).permit(:device_id, :state, :nick, :cel)
    # end

    def is_registered_params
      params.permit(:citizen_device,:format)
    end
end
