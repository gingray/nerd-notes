# frozen_string_literal: true
module Nerd
  module Notes
    module App
      class Init
        DIR = '.nerd-notes'
        DB_NAME = 'nerd-notes.sqlite3'
        CONFIG_NAME = 'config.yml'
        attr_reader :path_arr, :dir, :config_file, :db_file

        def initialize
          @dir = File.join(Dir.home, DIR)
          @db_file = File.join(Dir.home, DIR, DB_NAME)
          @config_file = File.join(Dir.home, DIR, CONFIG_NAME)
          @path_arr = [[dir, :dir], [db_file, :file], [config_file, :file]]
        end

        def call
          result = []
          path_arr.each do |path, type|
            created = check_or_create(path, type)
            result << [created, path]
          end
          check_or_create_db(db_file)
          result
        end

        def check_or_create(path, type)
          return false if File.exist?(path)
          FileUtils.mkdir_p(path) if type == :dir
          File.new(path, 'w') if type == :file
          true
        end

        def check_or_create_db(path)
          Database.new(path)
          App.migrate
          Models::Note.count
        end
      end
    end
  end
end
