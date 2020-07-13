# frozen_string_literal: true
module Nerd
  module Notes
    module App
      class Database
        def initialize(db_path)
          ActiveRecord::Base.establish_connection(
              adapter: 'sqlite3',
              database: db_path
          )
        end

        def call
        end
      end
    end
  end
end
