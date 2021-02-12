class Character
  attr_reader :name, :affiliation, :allies, :enemies, :photo_url

  def initialize(data)
    @name = data[:name]
    @allies = data[:allies]
    @enemies = data[:enemies]
    @affiliation = data[:affiliation]
    @photo_url = data[:photo_url]
  end
end