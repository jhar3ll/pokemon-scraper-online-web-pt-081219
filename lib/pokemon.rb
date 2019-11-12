class Pokemon
  attr_accessor :id, :name, :type, :db
  
 def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(db, id_number)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id=? 
    SQL
    poke_details = db.execute(sql, id_number)
  end

end
