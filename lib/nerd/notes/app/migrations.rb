# frozen_string_literal: true
#
module Nerd
  module Notes
    module App
      class Migrations
        class CreateNotesTable < ActiveRecord::Migration[5.2]
          def up
            unless ActiveRecord::Base.connection.table_exists?(:notes)
              create_table :notes do |table|
                table.string :title
                table.text :body
                table.timestamps
              end
            end
          end

          def down
            if ActiveRecord::Base.connection.table_exists?(:notes)
              drop_table :notes
            end
          end
        end

        def self.migrate
          CreateNotesTable.migrate(:up)
        end
      end
    end
  end
end
