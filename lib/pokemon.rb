require 'pry'
class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type) 
        

        #@db.execute(sql, self.name, self.type)
        #@id = @db.execute("SELECT last_insert_rowid() FROM pokemon") [0][0]
    end    

    def self.find(id,db)
        captured_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
        Pokemon.new(id: captured_pokemon[0], name: captured_pokemon[1], type: captured_pokemon[2], db: db)
    end

        

end    

#command,shift,L
