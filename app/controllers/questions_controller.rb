class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "askus", password: "askus", except: [:index, :show]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    # acts_as_votable
  end

  # GET /questions/1
  # GET /questions/1.json
  def show

  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    p '111111'
    p question_params
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        # format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        # format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


 # def upvote
 #    @question = Question.find(params[:id])
 #    # @question.votes.create
 #    # @question.liked_by current_user
 #     respond_to do |format|
 #      format.html { redirect_to question_url, notice: 'voted successfully'}
 #      format.json { head :no_content }

 #    end
 #  end
  
  def upvote 
  @question = Question.find(params[:id])
  @question.upvote_by current_user
  redirect_to :back
  end  
 
 
def downvote
  @question = Question.find(params[:id])
  @question.downvote_by current_user
  redirect_to :back
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :description, :skills => [], )
    end


end
