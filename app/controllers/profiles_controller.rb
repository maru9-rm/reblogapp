class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    # Userモデルでhas_one :profileと設定しているから.profileだけで取得できる
  end

  def edit
    @profile = current_user.prepare_profile
    # if current_user.profile.present?
    #     @profile = current_user.profile
    # else
    #     @profile = current_user.build_profile
    # end
    # あるいは
    # @profile = current_user.profile || current_user.build_profile
    # だが、よく使うのでモデル側に移してメソッド化している。
  end
  # 新しいガワを何度も作る必要がないからeditをnewの代用としても使うことでnewを省ける。ってことだと思う。多分。

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    # フォームの情報(profile_params)を１行目で用意したインスタンスに合体させる。
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed,
      :avatar
    )
  end
end
