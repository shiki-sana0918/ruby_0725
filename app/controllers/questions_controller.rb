class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # ここに一覧表示のコードを追加する（例: @questions = Question.all）
  end

  # 質問詳細ページ表示
  def show
    @question = Question.find(params[:id])
    # ここに詳細ページ表示のコードを追加する（例: @question = Question.find(params[:id])）
  end

  # 質問の作成
  def new
    @question = Question.new
    # 新しいquestion作ってね
  end

  # 質問の登録
  def create
    # Questions model初期化
    @question = Question.new(question_params)

    # Questionをdbへ保存
    if @question.save
      # showへリダイレクト（戻る）
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # 質問の編集
  def edit
    @question = Question.find(params[:id])

    # ここに編集ページ表示のコードを追加する（例: @question = Question.find(params[:id])）
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
 

    #  ここに質問更新のコードを追加する（例: question = Question.find(params[:id]); question.update(question_params)）
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to question_path
    
    # ここに質問削除のコードを追加する（例: question = Question.find(params[:id]); question.destroy）
  end

  private

  # パラメータの許可設定（Strong Parameters）
  def question_params
    params.require(:question).permit(:title,:name, :content) # :titleや:contentは適宜変更してください
  end
end
