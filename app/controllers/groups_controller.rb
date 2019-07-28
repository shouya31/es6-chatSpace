class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
    group_user = User.all

    user_name = group_user.map do |user|
      user.name
    end
    @user_name_json = user_name.to_json.html_safe

    user_id = group_user.map do |user|
      user.id
    end
    @user_id_json = user_id.to_json.html_safe

    @group.users << current_user
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
  def set_group
    @group = Group.find(params[:id])
  end
end