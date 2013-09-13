class SurveyMailer < ActionMailer::Base
  default from: "from@example.com"
  default :template_path => 'survey_mailer'

  def survey_email(survey,list)
    @survey = survey
    @survey_name = survey.name
    l = list
    mail(to: l, subject: @survey_name)
  end
end
