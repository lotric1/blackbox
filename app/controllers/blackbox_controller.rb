class BlackboxController < ApplicationController
    def index
        #@bboxes = Bbox.where(user_id: current_user.id)
        @bboxes = Bbox.all
    end
    def contents (bbox)
        #@bbox_contents = Bbox_contents.where(user_id: current_user.id, bbox_id: bbox.id)
        @bbox_contents = BboxContent.all
    end
end
