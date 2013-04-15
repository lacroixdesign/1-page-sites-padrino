class ProjectForm
  include ActiveAttr::Model

  attr_accessor :name, :email, :phone, :overview

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please provide a valid email address" }
end
