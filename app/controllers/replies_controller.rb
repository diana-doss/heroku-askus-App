class RepliesController < ApplicationController
def create
    @question = Question.find(params[:question_id])
    @reply = @question.replies.create(reply_params)
    redirect_to question_path(@question)
  end
 
 def destroy
    @question = Question.find(params[:question_id])
    @reply = @question.replies.find(params[:id])
    @reply.destroy
    redirect_to question_path(@question)
  end

  private
    def reply_params
      params.require(:reply).permit(:answer, :question_id)
    end

end
