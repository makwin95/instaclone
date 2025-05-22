# frozen_string_literal: true

# This file defines the ApplicationMailer class, which inherits from ActionMailer::Base.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
