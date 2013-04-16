class ProjectForm
  include ActiveAttr::Model

  attr_accessor :name, :email, :phone, :overview

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please provide a valid email address" }

  def submit
    if self.valid?
      form = wufoo.form(form_id)
      result = form.submit(form_params)
      if result['Success'] == 0
        # result['ErrorText']
        { message: "Validation Failed", errors: result['FieldErrors'].to_a }
      else
        { message: "Form was successfully submitted.", success: true }
      end
    else
      { message: "Validation Failed", errors: [self.errors.messages] }
    end
  end

private

  def account
    @account ||= ENV['WUFOO_ACCOUNT']
  end

  def key
    @key ||= ENV['WUFOO_KEY']
  end

  def form_id
    @form_id ||= ENV['WUFOO_FORM']
  end

  def wufoo
    @wufoo ||= WuParty.new(account, key)
  end

  def form_params
    {
      'Field1' => self.name,
      'Field3' => self.email,
      'Field4' => self.phone,
      'Field5' => overview
    }
  end

end
