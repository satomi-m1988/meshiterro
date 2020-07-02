class PostImagesController < ApplicationController
  def new
  	@post_image = PostImage.new#画像投稿
  end
  def create#投稿データ保存
  	@post_image = PostImage.new(post_image_params)
  	@post_image.user_id = current_user.id
  	if @post_image.save
  	  redirect_to post_images_path
    else
      render :new
    end
  end
  def index
    @post_images = PostImage.page(params[:page]).reverse_order#１ページ分の決められた数だけ表示できるようにする記述
  	#@post_images = PostImage.all#トップページへログイン後投稿された画像がタイムラインに表示されるようにする記述
    #↑このままだと画像が多くなってきた時全ての画像を表示する設定なので時間がかかる
  end
  def show
  	@post_image = PostImage.find(params[:id])#投稿画像詳細ページの設定
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])#削除したいデータを持ってきて@post_imageに代入するという記述
    @post_image.destroy#上記で見つけてきたデータをdestroyアクションで消すという記述
    redirect_to post_images_path
  end

  private#投稿データのストロングパラメーター
  def post_image_params
	params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  end
