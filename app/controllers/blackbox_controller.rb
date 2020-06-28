class BlackboxController < ApplicationController
    helper_method :contents


    def index
        #@bboxes = Bbox.all
        @bboxes = Bbox.where(user_id: current_user.id)
        @bbox_contents = BboxContent.all
    end

    def contents(bbox)
        #@bbox_contents = BboxContent.all
        items = BboxContent.where(user_id: current_user.id, bbox_id: bbox.id, completed: false)
        pinned = items.where(pinned: true).order(:next_date)
        unpinned = items.where(pinned: false).order(:next_date)
        n = bbox.items_per_day
        n = n - pinned.length()
        if n <= 0
            return pinned
        else
            return pinned + unpinned[0..(n - 1)]
        end
    end
end
