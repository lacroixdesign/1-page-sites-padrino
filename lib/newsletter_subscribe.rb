class NewsletterSubscribe
  include ActiveAttr::Model

  attr_accessor :email

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please provide a valid email address" }

  def submit
    if self.valid?
      account.throws_exceptions = false
      result = account.list_subscribe id: list_id, email_address: self.email
      if result == true
        { message: "Form was successfully submitted.", success: true }
      else
        { message: result["error"], errors: [result["code"]] }
      end
    else
      { message: "Validation Failed", errors: [self.errors.messages] }
    end
  end

private

  def key
    @key ||= ENV['MAILCHIMP_API_KEY']
  end

  def list_id
    @form_id ||= ENV['MAILCHIMP_LIST_ID']
  end

  def account
    @account ||= Gibbon.new(key)
  end

end
