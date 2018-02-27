require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('playwright.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwright")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @birth_year)
      INSERT INTO
        playwright (birth_year)
      VALUES
        (?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @birth_year, @id)
      UPDATE
        playwright
      SET
        birth_year = ?
      WHERE
        id = ?
    SQL
  end
end
