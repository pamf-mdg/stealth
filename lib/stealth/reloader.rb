# coding: utf-8
# frozen_string_literal: true

module Stealth
  class Reloader

    class_attribute :bot_file_path, default: Dir["#{File.expand_path(Pathname.new(Dir.pwd))}/bot/**/*.rb"]
    attr_reader :paths

    delegate :updated?, to: :updater

    def initialize
      @paths = Dir["#{File.expand_path(Pathname.new(Dir.pwd))}/bot/**/*.rb"]

      ActiveSupport::Dependencies.mechanism = :load
      ActiveSupport::Dependencies.autoload_paths = bot_file_path

      callback = lambda do
        ActiveSupport::DescendantsTracker.clear
        ActiveSupport::Dependencies.clear
      end

      Stealth.reloader.check = lambda do
        puts "CHECKING"
        Stealth.bot_reloader.updated?
      end

      reloader = ActiveSupport::EventedFileUpdateChecker.new(paths, &callback)

      Stealth.reloader.to_run(prepend: true) do
        puts "UNLOADING"
        class_unload! do
          reloader.execute
        end
      end

      reloader
    end

    def reload!
      clear!
      load_paths
    end

    def execute
      updater.execute
    end

    def execute_if_updated
      updater.execute_if_updated
    end

    def self.init!
      if Stealth.env == 'development'
        ActiveSupport::Dependencies.mechanism = :load
        ActiveSupport::Dependencies.autoload_paths = bot_file_path
      end
    end

    private

      def updater
        @updater ||= begin
          updater = ActiveSupport::FileUpdateChecker.new(paths) { reload! }
          updater.execute
          updater
        end
      end

      def clear!
        class_unload! do
          self.execute
        end
      end

      def load_paths
        paths.each { |path| load(path) }
      end

  end
end
