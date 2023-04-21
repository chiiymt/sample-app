class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを受け取る＆新規登録のためのインスタンスを作成
    list = List.new(list_params)
    
    #データをデータベースに保存するためのメソッド(saveメソッド)を実行
    list.save
    
    #詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
  
end
