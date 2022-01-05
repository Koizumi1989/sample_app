class ListsController < ApplicationController
  def new
    @list = List.new
  end
  # 「List.new」と定義することで、Listモデルの情報をもとに
# 新しくオブジェクトが作成され、Listモデルに存在するtitle・bodyが格納
# できるようになります。

  def create
    list = List.new(list_params)
    list.save
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
