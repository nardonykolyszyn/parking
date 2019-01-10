# frozen_string_literal: true

module Api
  module V1
    class Parking::VehiclesController < ApplicationController
      def index
        @vehicles = params[:all_vehicles].present? ? Vehicle.previous_parked : ParkTime.current_vehicles_parked
        render json: @vehicles, status: :ok
      end
    end
  end
end
