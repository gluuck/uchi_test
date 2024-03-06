module Api
  module V1
    class ClassRoomsController < Api::BaseController
      def index
        school ||= School.includes(:class_rooms).find(params[:class_room][:school_id])
        
        render_success school.class_rooms
      end
    end
  end
end