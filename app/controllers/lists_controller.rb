class ListsController < ApplicationController
  def new
    @list = List.new
    # List.newのnewとdef newのnewは違う。createの箇所も同じ。
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
    @lists = List.all
    # List.all　listsーブルに保存された全データ取得
    # インスタンス変数は自由に名前を決めることができますが、
    # 今回は複数のListレコードが取得できるので、複数形で@listsのよう変数名にしました。
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
