class ProfilesController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @profile = current_user.profile
    end
  
    def edit
      @profile = current_user.build_profile(profile_params)
    end

    # def create
    #   @profile = current_user.profile.build(profile_params)
    #     if @article.save
    #       redirect_to profile_path(@profile), notice: '保存できたよ'
    #     else
    #       flash.now[:error] = '保存に失敗しました'
    #       render :new
    #     end
    # end
    def update
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'プロフィール更新！'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  
    private
    def profile_params
      params.permit(
        :nickname,
        :introducsion,
        :gender,
        :avatar
      )
    end
  end