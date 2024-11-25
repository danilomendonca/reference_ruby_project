require 'logger'

module AppLogger
  def self.logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.level = (ENV['DEBUG'] ? Logger::DEBUG : Logger::INFO)
      log.formatter = proc do |severity, timestamp, _progname, msg|
        "#{timestamp} [#{severity}] #{msg}\n"
      end
    end
  end
end
