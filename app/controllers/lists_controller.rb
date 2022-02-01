class ListsController < ApplicationController
  def new
    @list = List.new #newactionで定義している変数（@list)はnewactionかnew.htmlでしか使えない。
    # List.newのnewとdef newのnewは違う。createの箇所も同じ。
  end
  # 「List.new」と定義することで、Listモデルの情報をもとに
# 新しくオブジェクトが作成され、Listモデルに存在するtitle・bodyが格納
# できるようになります。

  def create #httpメソッドpost
    @list = List.new(list_params) #strongパラメーターのlist_params
    if @list.save
      redirect_to list_path(@list.id) #viewがないからどこに遷移するかかかないとエラーが出る。 list_pathのlistはroutesのas名前部分。redirectの場合は_pathをつける必要がある。
    else
      render :new
    end
  end
   # render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。

  def index
    @lists = List.all
    # List.all　listsーブルに保存された全データ取得
    # インスタンス変数は自由に名前を決めることができますが、
    # 今回は複数のListレコードが取得できるので、複数形で@listsのよう変数名にしました。
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update #httpメソッドpatch
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy #httpメソッドdelete
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end

  private
  # private以下はこのコントローラー内でしか呼び出せません。
  def list_params
    params.require(:list).permit(:title, :body, :image)
    # params formから送られてくるデータが入る
    # require データの中からモデル名（ここではlist）を指定し絞り込む
    # permit requireで絞り込んだデータの中から、保存を許可するカラムを指定
  end
end
