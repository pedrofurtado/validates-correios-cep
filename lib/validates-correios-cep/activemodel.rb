require "correios-cep"
require "active_model"

module ActiveModel
  module Validations
    class CorreiosCepValidator < EachValidator
      CORREIOS_CEP_I18N_SCOPE = "correios_cep.errors.messages"

      def validate_each(record, attribute, value)
        error_message_scope = begin
            "#{CORREIOS_CEP_I18N_SCOPE}.not_exists" if Correios::CEP::AddressFinder.get(value).blank?
          rescue EOFError
            "#{CORREIOS_CEP_I18N_SCOPE}.connection_failed"
          rescue ArgumentError
            "#{CORREIOS_CEP_I18N_SCOPE}.invalid"
          rescue Net::OpenTimeout
            "#{CORREIOS_CEP_I18N_SCOPE}.timeouted"
          end

        record.errors.add(attribute, I18n.t(error_message_scope, zipcode: value)) if error_message_scope.present?
      end
    end

    module HelperMethods
      def validates_correios_cep_of(*attributes)
        validates_with CorreiosCepValidator, _merge_attributes(attributes)
      end
    end
  end
end
