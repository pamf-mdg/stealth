# coding: utf-8
# frozen_string_literal: true

module Stealth
  class Reloader

    class_attribute :bot_file_path, default: Dir["#{File.expand_path(Pathname.new(Dir.pwd))}/bot/**/*.rb"]

    def self.init!
      if Stealth.env == 'development'
        ActiveSupport::Dependencies.mechanism = :load
        ActiveSupport::Dependencies.autoload_paths = bot_file_path

        @@reloader = ActiveSupport::FileUpdateChecker.new(bot_file_path) do
          ActiveSupport::DescendantsTracker.clear
          ActiveSupport::Dependencies.clear
        end
        @@reloader.execute

        # ActiveSupport::Reloader.to_prepare do
        #   i18n_reloader.execute_if_updated
        # end

        # reloader.check = lambda do
        #   reloader.updated?
        # end
      end
    end

    def self.reloader
      @@reloader
    end

    def self.clear_dependencies!
      if Stealth.env == 'development'
        Stealth::Reloader.reloader.execute_if_updated
      end
    end

  end
end
