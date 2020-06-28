class BboxesController < ApplicationController
  before_action :set_bbox, only: [:show, :edit, :update, :destroy, :flip_starred]

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
    @bbox.position = BboxContent.where(user_id: current_user.id).length()
    respond_to do |format|
      if @bbox.save
        format.html { redirect_to @bbox, notice: 'Bbox was successfully created.' }
        format.json { render :show, status: :created, location: @bbox }
      else
        format.html { render :new }
        format.json { render json: @bbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bboxes/1
  # PATCH/PUT /bboxes/1.json
  def update
    respond_to do |format|
      if @bbox.update(bbox_params)
        format.html { redirect_to @bbox, notice: 'Bbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @bbox }
      else
        format.html { render :edit }
        format.json { render json: @bbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bboxes/1
  # DELETE /bboxes/1.json
  def destroy
    @bbox.destroy
    respond_to do |format|
      format.html { redirect_to bboxes_url, notice: 'Bbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def flip_starred
    @bbox.starred = ! @bbox.starred
    if @bbox.save()
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
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
