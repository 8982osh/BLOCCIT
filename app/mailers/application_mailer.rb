class ApplicationMailer < ActionMailer::Base
  #made change for module 54 to solve confirmation url error.
  default from: "test@example.com"
  layout 'mailer'
end
