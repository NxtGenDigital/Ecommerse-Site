class ApplicationMailer < ActionMailer::Base
  default from: "shrithi_store@shrithi.com"
  layout 'mailer'
  def send_mail(email,body,subject)
      mail(:to=>email,:body=>body,:subject=>subject)
      #attachment['filename'] = File.read("File_Path") 
  end 
end
