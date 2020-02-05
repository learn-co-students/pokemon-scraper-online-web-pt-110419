class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.new_from_db(row, db)
    Pokemon.new(id: row[0],name: row[1],type: row[2],db: db)
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL

    db.execute(sql,name,type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL

    db.execute(sql, id).collect do |row|
      self.new_from_db(row, db)
    end.first
  end


end
