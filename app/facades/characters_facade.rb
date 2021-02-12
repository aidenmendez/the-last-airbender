class CharactersFacade
  def self.find_by_nation(nation)
    nation_title = nation.split("_").first
    characters_data = CharactersService.get_characters_data(nation_title)
    make_characters(characters_data)
    
  end

  private

  def self.make_characters(characters_data)
    characters_data.each do |data|
      require 'pry'; binding.pry
      Character.new(data)
    end
  end
end