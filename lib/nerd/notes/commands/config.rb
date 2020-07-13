# frozen_string_literal: true

require_relative '../command'

module Nerd
  module Notes
    module Commands
      class Config < Nerd::Notes::Command
        def initialize(options)
          @options = options
        end

        def execute(input: $stdin, output: $stdout)
          created_paths = ::Nerd::Notes::App::Init.new.call
          created_paths.each do |created, path|
            if created
              output.puts "[CREATED] #{path}"
            else
              output.puts "[EXIST] #{path}"
            end
          end
        end
      end
    end
  end
end
