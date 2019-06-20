class Api::V1::UserRelationshipsController < ApplicationController

  def create
    get_ids
    relationship = UserRelationship.create(follower_id: @follower.id, followed_id: @followed.id, confirmed: true)
    # Change this to false for friend requests
    render json: relationship, status: :accepted
  end

  def update
    get_ids
    relationship_id = UserRelationship.where(follower_id: @follower.id, followed_id: @followed.id).pluck(:id)
    relationship = UserRelationship.find(relationship_id)
    relationship.update(confirmed: true)
    render json: relationship, status: :accepted
  end

  def destroy
    relationship = UserRelationship.find(params[:id])
    copy = relationship
    relationship.destroy
    render json: relationship, status: :accepted
  end

  private

  def get_ids
    @follower = User.find(params[:follower_id])
    @followed = User.find(params[:followed_id])
  end

  # def relationship_params
    # params.require[:user_relationship].permit[:followed_id, :follower_id]
  # end

end
