class BlackboxController < ApplicationController
    helper_method :contents, :boxes


    def index
        #@bboxes = Bbox.all
        #@bboxes = Bbox.where(user_id: current_user.id)
        #@bbox_contents = BboxContent.all
    end

    def boxes
        return Bbox.where(user_id: current_user.id).order(:position)
    end

    def contents(bbox) # to display on main page
        #@bbox_contents = BboxContent.all
        items = BboxContent.where(user_id: current_user.id, bbox_id: bbox.id, completed: false)
        never_passed = items.where ("pass_counter = 0")
        passed_before = items.where ("pass_counter > 0")
        pinned = passed_before.where(pinned: true).order(:next_date)
        unpinned = passed_before.where(pinned: false).order(:next_date)
        n = bbox.items_per_day
        n = n - pinned.length()
        if n <= 0
            return pinned + never_passed
        else
            return pinned + unpinned[0..(n - 1)] + never_passed
        end
    end
end
