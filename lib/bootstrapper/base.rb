class Bootstrapper
  module Base
    class << self

      def render_data(options)
        data = Bootstrapper.all_variables || {}

        namespace, tag, cameled = parse_options options
        start     = "#{tag if tag}window.#{namespace} = {};"
        script    = ''

        data.each do |key, val|
          if cameled
            script << "#{namespace}.#{key.to_s.camelize(:lower)}=#{val.to_json};"
          else
            script << "#{namespace}.#{key.to_s}=#{val.to_json};"
          end
        end

        script = start + Bootstrapper::Escaper.escape(script)
        script << '</script>' if tag
        script.html_safe
      end

      private

      def parse_options(options)
        namespace  = options[:namespace] || 'bootstrap'
        need_tag   = options[:need_tag].nil? || options[:need_tag]
        need_type  = options[:need_type].present? && options[:need_type]
        cameled    = options[:camel_case].nil? || options[:camel_case]
        tag = need_tag && (need_type ? '<script type="text/javascript">' : '<script>')

        [namespace, tag, cameled]
      end

    end
  end
end
