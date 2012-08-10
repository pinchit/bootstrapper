class Bootstrapper
  module Helpers

    def self.included base
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods

      def bootstrap_data(options = {})
        if variables_for_request_present?
          Bootstrapper::Base.render_data(options)
        else
          Bootstrapper.clear if Bootstrapper.all_variables.present?
          Bootstrapper::Base.render_data(options)
        end
      end

      private

      def variables_for_request_present?
        Bootstrapper::Request.env &&
        Bootstrapper::Request.id == request.object_id &&
        Bootstrapper.all_variables.present?
      end

    end
  end

  module BootstrapperHelpers

    def self.included base
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods

      def bootstrap
        if wrong_bootstrapper_request?
          Bootstrapper::Request.id = request.object_id
          Bootstrapper::Request.env = request.env
        end
        Bootstrapper
      end

      private

      def wrong_bootstrapper_request?
        Bootstrapper::Request.env.blank? ||
        Bootstrapper::Request.id != request.object_id
      end

    end

  end
end

ActionView::Base.send :include, Bootstrapper::Helpers
ActionController::Base.send :include, Bootstrapper::BootstrapperHelpers
