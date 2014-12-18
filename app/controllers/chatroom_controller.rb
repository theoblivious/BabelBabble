class ChatroomController < ApplicationController
  def front
  end

  def room
    # we will use this later when we want to specify other chatrooms
    # @chatroom = Chatroom.find(params[:id])
    # we need to instantiate the table in order to call on the table
    @users = User.all.order("score DESC").where.not(score: 'nil')
    respond_to do |format|
      format.html
      format.json {render json: @users}
    end
  end
end
