class ChatMessagesController < ApplicationController
 # all publishing events are being handled by this controller function. We are listening for the :message params.
  def create
    message_user = current_user.name
    message = params[:message]
    if message == '@ROBOT'
      message_user = 'NUMBER 5'
      message = "I haz ALL the javascripts!  Want some?"
    elsif message == '@ROBOT_QUIZ'
      message_user = 'ROBOT_QUIZ'
      message = Quiz.all.sample.question

    end
# TODO
    #  if message =='@ROBOT_QUIZ'  post a question
    # if message == '@ANSWER' see if its correct....sorry that isnt the correct answer.
    #put in the logic in the model so that I can specify that:
    # current_question=  the random question sample
    #  current_answer = the random answer to that question.



# running all publishing events through faye in our controller.
    require 'eventmachine'

    EM.run {
      client = FayeRails.client

      # client.subscribe('/messages') do |message|
      #   puts message.inspect
      # end

      client.publish('/messages/public', 'msg' => message, username: message_user)
    }
    # expecting to render a view if we dont do anything.
    render nothing: true, :status => :ok
  end
end
