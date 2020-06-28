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
        items = BboxContent.where(user_id: current_user.id, bbox_id: bbox.id, completed: false).order(:next_date)
        if bbox.starred
            return items.order(:pinned, :insertion_date)
        else
            pinned = items.where(pinned: true)
            unpinned = items.where(pinned: false)
            never_passed = unpinned.where ("pass_counter = 0")
            passed_before = unpinned.where ("pass_counter > 0")
            n = bbox.items_per_day
            n = n - pinned.length()
            if n <= 0
                return pinned + never_passed
            else
                return pinned + passed_before[0..(n - 1)] + never_passed
            end
        end
    end
end
