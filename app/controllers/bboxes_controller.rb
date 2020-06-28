class BboxesController < ApplicationController
  before_action :set_bbox, only: [:show, :edit, :update, :destroy, :flip_starred]
  helper_method :boxes

  # GET /bboxes
  # GET /bboxes.json
  def index
  end

  # GET /bboxes/1
  # GET /bboxes/1.json
  def show
  end

  # GET /bboxes/new
  def new
    @bbox = Bbox.new
  end

  # GET /bboxes/1/edit
  def edit
  end

  # POST /bboxes
  # POST /bboxes.json
  def create
    @bbox = Bbox.new(bbox_params)
    @bbox.user_id = current_user.id
    @bbox.creation_date = Time.now()
    @bbox.starred = 0
    @bbox.color = "#000000"
    @bbox.position = boxes().where(user_id: current_user.id).length()
    if @bbox.save
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /bboxes/1
  # PATCH/PUT /bboxes/1.json
  def update
    redirect_back(fallback_location: root_path)
    if @bbox.update(bbox_params)
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /bboxes/1
  # DELETE /bboxes/1.json
  def destroy
    # Destroy all contents of bbox
    BboxContent.where(user_id: current_user.id, bbox_id: @bbox.id).each do |content|
      content.destroy()
    end
    if @bbox.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  def flip_starred
    @bbox.starred = ! @bbox.starred
    if @bbox.save()
      redirect_back(fallback_location: root_path)
    end
  end

  def boxes
    return Bbox.where(user_id: current_user.id).order(:position)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bbox
      @bbox = Bbox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bbox_params
      params.require(:bbox).permit(:title, :items_per_day)
    end
end
