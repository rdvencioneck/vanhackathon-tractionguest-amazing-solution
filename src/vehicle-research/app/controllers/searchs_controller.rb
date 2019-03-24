class SearchsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # http_basic_authenticate_with name: "tractionguest", password: "secret"
    def create
        @vehicle = nil;
        status = 200
        if(!start_search(params[:plate]))
            status = 204
        end

        render json: @vehicle, :status => status
    end

    private
        def start_search(plate)
            @vehicle = Vehicle.find_by(plate: plate)

            if(@vehicle)
                @vehicle.in_queue = 1
                @vehicle.save

                return @vehicle
            else
                return false
            end
        end
end
