# ApplicationMailer はメール処理の規定となるクラス
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
