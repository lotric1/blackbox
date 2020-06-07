class BboxContentsController < ApplicationController
  before_action :set_bbox_content, only: [:show, :edit, :update, :destroy]

  # GET /bbox_contents
  # GET /bbox_contents.json
  def index
    @bbox_contents = BboxContent.all
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

    respond_to do |format|
      if @bbox_content.save
        format.html { redirect_to @bbox_content, notice: 'Bbox content was successfully created.' }
        format.json { render :show, status: :created, location: @bbox_content }
      else
        format.html { render :new }
        format.json { render json: @bbox_content.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bbox_content
      @bbox_content = BboxContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bbox_content_params
      params.require(:bbox_content).permit(:text, :insertion_date, :completion_date, :due_date, :completed, :pinned, :pass_counter, :bbox_id)
    end
end
