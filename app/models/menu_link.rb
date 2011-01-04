class MenuLink < Menu

  attr_reader :name
  attr_reader :url

  def initialize(name, url)
    @name = name
    @url = url
  end

end
