class BboxContentsController < ApplicationController
  before_action :set_bbox_content, only: [:show, :edit, :update, :destroy, :pass, :flip_pinned]
  helper_method :contents

  # GET /bbox_contents
  # GET /bbox_contents.json
  def index
  end

  # GET /bbox_contents/1
  # GET /bbox_contents/1.json
  def show
  end

  # GET /bbox_contents/new
  def new
    @bbox_content = BboxContent.new
  end
  
  # GET /bbox_contents/1/edit
  def edit
  end
  
  # POST /bbox_contents
  # POST /bbox_contents.json
  def create
    @bbox_content = BboxContent.new(bbox_content_params)
    @bbox_content.user_id = current_user.id
    @bbox_content.insertion_date = Time.now()
    @bbox_content.completed = false
    @bbox_content.pinned = false
    @bbox_content.pass_counter = 0
    @bbox_content.next_date =  @bbox_content.insertion_date
    
    #if @bbox_content.save
    @bbox_content.save
    redirect_back(fallback_location: root_path)
    #respond_to do |format|
        #format.html { redirect_to @bbox_content, notice: 'Bbox content was successfully created.' }
        #format.json { render :show, status: :created, location: @bbox_content }
     # else
     #   format.html { render :new }
     #   format.json { render json: @bbox_content.errors, status: :unprocessable_entity }
     # end
    #end
  end

  # PATCH/PUT /bbox_contents/1
  # PATCH/PUT /bbox_contents/1.json
  def update
    respond_to do |format|
      if @bbox_content.update(bbox_content_params)
        format.html { redirect_to @bbox_content, notice: 'Bbox content was successfully updated.' }
        format.json { render :show, status: :ok, location: @bbox_content }
      else
        format.html { render :edit }
        format.json { render json: @bbox_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bbox_contents/1
  # DELETE /bbox_contents/1.json
  def destroy
    @bbox_content.destroy
    respond_to do |format|
      format.html { redirect_to bbox_contents_url, notice: 'Bbox content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contents # to display on list of activities
    return BboxContent.where(user_id: current_user.id).order(:completed, :bbox_id, :pinned, :next_date)
  end

  def pass
    intervals = [1, 4, 10, 20, 40, 80, 160] # days
    n = [intervals.length - 1, @bbox_content.pass_counter].min
    @bbox_content.next_date += intervals[n] * 86400 # 86400 seconds = 1 day
    @bbox_content.pass_counter += 1
    @bbox_content.save()
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Passed ' + @bbox_content.text }
      format.json { head :no_content }
    end
  end

  def flip_pinned
    @bbox_content.pinned = ! @bbox_content.pinned
    if @bbox_content.save()
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bbox_content
      @bbox_content = BboxContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bbox_content_params
      params.require(:bbox_content).permit(:text, :bbox_id)
    end
end
