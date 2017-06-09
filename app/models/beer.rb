class Beer
  attr_accessor :id, :name, :style, :alcohol
  def initialize(hash_options)
    @id = hash_options["id"]
    @name = hash_options["name"]
    @style = hash_options["style"]
    @alcohol = hash_options["alcohol"]    
  end
end