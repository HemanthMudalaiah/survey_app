class SurveysController < ApplicationController
  before_filter :authenticate_user!,:except => [:take_survey,:survey_sucess]
  def index
    @surveys = Survey.all
  end

  def take_survey
    @survey = Survey.find_by_id(params[:id])
  end

  def show_survey
    @survey = Survey.find_by_id(params[:id])
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    1.times do
      question = @survey.questions.build
      1.times { question.answers.build }
    end
  end

  def create
    @survey = Survey.new(params[:survey])
      if @survey.save
        redirect_to @survey, :notice => "Successfully created survey."
      else
        render :action => 'new'
      end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end

  def survey_capture
    @survey = Survey.find_by_id(params[:id])
    @survey.questions.each_with_index do |question,i|
      answer = Answer.new(:question_id => question.id, :content => params[:answer][question.id.to_s],:email => params[:email],:survey_id => @survey.id)
      answer.save
    end
      redirect_to "/survey_sucess?email=#{params[:email]}&id=#{@survey.id}"
  end

  def survey_sucess
    @answer = Answer.find_all_by_email_and_survey_id(params[:email],params[:id])
  end

  def send_survey
    @survey = Survey.find_by_id(params[:id])
    list = params[:email_id].split(',')
    list.each do |list|
      survey_mail = SurveyMailer.survey_email(@survey,list).deliver!
    end
  end
end
