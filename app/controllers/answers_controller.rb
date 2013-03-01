class AnswersController < ApplicationController
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @option }
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @user = User.find(session[:user_id])

    depth = Answer.depth(Answer.find(params[:id]))
    depth.times do
      @answer.confirmations.build
    end

    @options = Option.find(:all, :conditions => {:option_id => 0, :quiz_id => @answer.quiz_id})
    @json = Option.json_tree(@options)
  end

  def create
    @answer = Answer.new(:user_id => session[:user_id], :option_id => params[:id], :quiz_id => params[:quiz])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answers were successfully submitted' }
        format.json { render json: @answer, status: :created, location: @option }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
end
