Rails.application.routes.draw do
  get 'lists/new'
  post 'lists' => 'lists#create'
  # post listsは投稿ボタン（new.html)と連動している。下記へ続く
  # ボタン押すと動く。動くとリストコントローラーのクリエイトへ送るという意味
  # 動かすため(lists)にform_withはpostメソッドでリストコントローラーの　
  # クリエイトへ送る。
  
  # postのlistsはcontroller名と同じ(modelの複数形)名前なのでリンクできる。
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
