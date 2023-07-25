class QuestionsController < ApplicationController
    # 質問一覧表示
    def index
      # ここに一覧表示のコードを追加する（例: @questions = Question.all）
    end
  
    # 質問詳細ページ表示
    def show
      # ここに詳細ページ表示のコードを追加する（例: @question = Question.find(params[:id])）
    end
  
    # 質問の作成
    def new
      @question = Question.new
    #   新しいquestions作ってね
    end
  
    # 質問の登録
    def create
        # p question = params

        # Questionsmodel初期化
        @question = Question.new(question_params)

        # Qestionsをdbへ保存
        @question.save

        # showへ　リダイレクト（戻る
        redirect_to @question

        
    end
  
    # 質問の編集
    def edit
      # ここに編集ページ表示のコードを追加する（例: @question = Question.find(params[:id])）
    end
  
    # 質問の更新
    def update
      # ここに質問更新のコードを追加する（例: question = Question.find(params[:id]); question.update(question_params)）
    end
  
    # 質問の削除
    def destroy
      # ここに質問削除のコードを追加する（例: question = Question.find(params[:id]); question.destroy）
    end


    private
    def question_params 
        params.require(:question).parmit(:title,:name,:content)
    end

  
    private
  
    # パラメータの許可設定（Strong Parameters）
    def question_params
      params.require(:question).permit(:title, :content) # :titleや:contentは適宜変更してください
    end
  end
  