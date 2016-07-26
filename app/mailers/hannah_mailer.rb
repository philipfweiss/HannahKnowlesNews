class HannahMailer < ApplicationMailer
  default from: 'news.by.hannah.noreply@gmail.com'

  def news_email (title, link, email)
    mail(to: email, subject: title, link: link)
  end
end
