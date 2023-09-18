class RelationshipsController < ApplicationController

    def create
      relationship = Relationship.new(follower_id: current_user, followed_id: params[:user_id])
      relationship.save
      flash[:notice] = 'User is follow successfully.'
      redirect_to request.referer
    end

    def destroy
      relationship = Relationship.find_by(follower_id: current_user, followed_id: params[:user_id])
      relationship.destroy
      flash[:alert] = "User was Unfollowed successfully. "
      redirect_to request.referer
    end
    
    def following
      @following_users = User.find(params[:user_id]).following_users
    end
    
    def followed
      @followed_users = User.find(params[:user_id]).followed_users
    end
    
end
