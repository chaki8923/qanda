class QuestionsController < ApplicationController
  #質問一覧
  def index
    @questions = Question.all

  end

  #質問詳細
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    
  end

  #質問作成画面
  def new
    @question = Question.new
  end

  #質問作成処理
  def create
    #Questionモデルの初期化
    @question = Question.new(question_params)
    #QuestionモデルをDBへ保存
    if @question.save
      #showへリダイレクト
     redirect_to @question
    else
      render 'new',status: :unprocessable_entity
    end
  end

  #質問修正画面
  def edit
    @question = Question.find(params[:id])
  end

  #質問修正処理
  def update
    @question = Question.find(params[:id])
    
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: '編集しました' }
        format.json { render :show, status: :created, location: @question }
      else
        # status: :unprocessable_entity が必須！！
        render 'edit',status: :unprocessable_entity
        
      end
    end
  end

  #質問削除（画面として必要ではない）
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path,notice: '削除しました'
  end

  private
  def question_params
    params.require(:question).permit(:title,:name,:content)
  end

end
