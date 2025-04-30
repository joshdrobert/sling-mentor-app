class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@yourdomain.com',  # Use your actual domain, not gmail
         reply_to: 'support@yourdomain.com' # Add a proper reply-to address
   layout 'mailer'
end
