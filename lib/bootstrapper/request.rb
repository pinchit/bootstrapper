class Bootstrapper
  module Request
    class << self

      def env
        @request_env if defined? @request_env
      end

      def env=(environment)
        @request_env = environment
        @request_env['bootstrapper'] ||= {}
      end

      def id
        @request_id if defined? @request_id
      end

      def id=(request_id)
        @request_id = request_id
      end

      def bootstrapper
        env['bootstrapper'] if env
      end

      def clear
        env && (env['bootstrapper'] = {})
      end

    end
  end
end
