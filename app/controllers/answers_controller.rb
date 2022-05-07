class AnswersController < ApplicationController




 
  #質問作成処理
  def create
   @question = Question.find(params[:question_id])
   @answer = @question.answers.build(answer_params)
   if @answer.save
    redirect_to question_path(@question), notice: 'コメントを投稿しました!'
   else
    render 'questions/show',status: :unprocessable_entity
   end
  end
  
  
  
  #質問削除（画面として必要ではない）
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to root_path,status: :see_other, notice: 'コメントを削除しました!'

  end

    private
    def answer_params
    params.require(:answer).permit(:name,:content)
    end

end
