class NewsPagesController < ApplicationController
  before_action :set_news_page, only: [:show, :edit, :update, :destroy]

  # GET /news_pages
  # GET /news_pages.json
  def index
    @news_pages = NewsPage.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  # GET /news_pages/1
  # GET /news_pages/1.json
  def show
  end

  # GET /news_pages/new
  def new
    @news_page = NewsPage.new
  end

  # GET /news_pages/1/edit
  def edit
  end

  # POST /news_pages
  # POST /news_pages.json
  def create
    @news_page = NewsPage.new(news_page_params)

    respond_to do |format|
      if @news_page.save
        format.html { redirect_to @news_page, notice: 'News page was successfully created.' }
        format.json { render :show, status: :created, location: @news_page }
      else
        format.html { render :new }
        format.json { render json: @news_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_pages/1
  # PATCH/PUT /news_pages/1.json
  def update
    respond_to do |format|
      if @news_page.update(news_page_params)
        format.html { redirect_to @news_page, notice: 'News page was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_page }
      else
        format.html { render :edit }
        format.json { render json: @news_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_pages/1
  # DELETE /news_pages/1.json
  def destroy
    @news_page.destroy
    respond_to do |format|
      format.html { redirect_to news_pages_url, notice: 'News page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_page
      @news_page = NewsPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_page_params
      params.require(:news_page).permit(:title, :content)
    end
end
