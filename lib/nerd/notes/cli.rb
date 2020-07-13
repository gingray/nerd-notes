# frozen_string_literal: true

require 'thor'
require 'sqlite3'
require 'active_record'
require_relative "./app/migrations"
require_relative "./app/init"
require_relative "./app/database"
require_relative "./app/models/note"


module Nerd
  module Notes
    # Handle the application command line parsing
    # and the dispatch to various command objects
    #
    # @api public
    class CLI < Thor
      # Error raised by this runner
      Error = Class.new(StandardError)

      desc 'version', 'nerd-notes version'
      def version
        require_relative 'version'
        puts "v#{Nerd::Notes::VERSION}"
      end
      map %w(--version -v) => :version

      desc 'config', 'Command description...'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def config(*)
        if options[:help]
          invoke :help, ['config']
        else
          require_relative 'commands/config'
          Nerd::Notes::Commands::Config.new(options).execute
        end
      end
    end
  end
end
