require "pry"
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
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)[0]

    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * 
        FROM pokemon
        WHERE id = ?
        SQL
        data = db.execute(sql, id)[0]

        new_entry = self.new(id: data[0], name: data[1], type: data[2], db: db)
        new_entry

    end
end
