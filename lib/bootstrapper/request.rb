class Gon
  module Request
    class << self

      def bootstrapper
        env['bootstrapper'] if env
      end

      def clear
        env && (env['bootstrapper'] = {})
      end

    end
  end
end
