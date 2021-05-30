class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @team = params[:team_id]
	@pagy, @posts = pagy(Post.where(team_id: @team).all, items: 10)
	  
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
	  @team = params[:team_id]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
	@team = @post.team_id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_list_path(@team), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
	@team = @post.team_id
	  
    respond_to do |format|
      format.html { redirect_to post_list_path(@team), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	def upvote
    	@post = Post.find(params[:id])
 
    #만약 '찬성' 투표를 이미 한 경우 : '찬성' 투표 취소
		if ((current_user.voted_up_on? @post) == true)
			@post.unliked_by current_user
			redirect_to(request.referrer, :notice => '해당 글의 추천을 취소하셨습니다.')
		else
			@post.upvote_by current_user
			redirect_to(request.referrer, :notice => '해당 글을 추천하셨습니다.')
		end
	end
 
	# 투표 관련 Controller 내용 : 반대
	def downvote
		@post = Post.find(params[:id])

		#만약 '반대' 투표를 이미 한 경우 : '반대' 투표 취소
		if ((current_user.voted_down_on? @post) == true)
			@post.unliked_by current_user    
			redirect_to(request.referrer, :notice => '해당 글의 반대를 취소하셨습니다.')
		else
			@post.downvote_from current_user
			redirect_to(request.referrer, :notice => '해당 글을 반대하셨습니다.')
		end
	end

	
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :team_id, :title, :contents)
    end
end
