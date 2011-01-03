class MenuLink
  extend ActiveModel::Naming

  attr_reader :name
  attr_reader :url

  def initialize(name, url)
    @name = name
    @url = url
  end

end
