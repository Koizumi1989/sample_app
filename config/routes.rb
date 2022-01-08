Rails.application.routes.draw do
  get 'lists/new'
  post 'lists' => 'lists#create'
  # post listsは投稿ボタン（new.html)と連動している。下記へ続く
  # ボタン押すと動く。動くとリストコントローラーのクリエイトへ送るという意味
  # 動かすため(lists)にform_withはpostメソッドでリストコントローラーの
  # クリエイトへ送る。

  # postのlistsはcontroller名と同じ(modelの複数形)名前なのでリンクできる。
  get 'lists' => 'lists#index',as: 'lists_index'
  get 'lists/:id' => 'lists#show',as: 'list'
  get 'lists/:id/edit' => 'lists#edit',as: 'edit_list'
  get '/top' => 'homes#top'
  patch 'lists/:id' => 'lists#update',as: 'update_list'
  delete 'lists/:id' => 'lists#destroy',as: 'destroy_list'
  # httpメソッド/url/list controller#action/名前付きpath
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end