

class ChatMessagesController < ApplicationController
  # all publishing events are being handled by this controller function. We are listening for the :message params.
  def create
    message_user = current_user.name
    message = params[:message]
    # we are  passing in the chatroom id currently to just a chatroom of 1
    chatroom = Chatroom.find(params[:chatroom_id])
    # puts (chatroom.game_mode)
    # puts (chatroom.quiz.answer == message)
    # puts ((chatroom.game_mode) && (chatroom.quiz.answer == message))

    # if ((chatroom.game_mode) && (chatroom.quiz.answer == message))
    #   message_user = "Robot"
    #   message = current_user.name + " got the question correct!"
    # end
    case message
    when /@ROBOT/i
      message_user = 'NUMBER 5'
      message = "I haz ALL the javascripts!  Want some?"
    when /@QUIZ/i
      if !chatroom.game_mode #we want game mode default to false
        random_quiz = Quiz.all.sample
        random_id= random_quiz.id  #dont need this maybe up for deletion.
        random_question= random_quiz.question
        random_answer = random_quiz.answer
        message_user = 'ROBOT_QUIZ'
        message = random_question
        chatroom.update(quiz_id: random_id)
        chatroom.update(game_mode: true)
      else
        message = "Quiz is already running."
      end
    when chatroom.quiz.answer
      chatroom.update(game_mode: true)
      puts "THINGSSSS"
      message_user = "Robot"
      message = current_user.name + " got the question correct!"
      chatroom.update(game_mode: false)

    when /@wdi3/
      message_user = "#{current_user.name}"
      message = "WDI 3 FOR LIFE! "
    else
      # publish message
    end

    #  need to add an else logic maybe add some seed logic





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
