require_relative 'errors'
require_relative 'element'
require 'logger'


class ElementFactory
  @min_version = 7.0
  @max_sdk_version = 9.0
  @logger = Logger.new(STDOUT)

  def self.ascii_art(version)
    art = "\n"
    art += "                                             \n"
    art += "                ______________            ___\n"
    art += "               /__/__\__\__\__\       ___/__/\n"
    art += "              /_ /__/_\__\__\__\  ___/__/__/ \n"
    art += "             /__/__/__/\__\__\__\/__/__/__/  \n"
    art += "            /__/__/__/  \__\__\__\_/__/__/   \n"
    art += "           /__/__/       \__\__\__\__/__/    \n"
    art += "          /__/            \__\__\__\/__/     \n"
    art += "                                             \n"
    art += "             NetApp SolidFire Version "+version.to_s+"    \n"
    art += "                                             \n"
    return art
  end


  def self.create(target, username, password, version = nil, verify_ssl = false, port = 443)
    target_is_ip = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.match(target)
    if target_is_ip != nil and verify_ssl
      raise SdkOperationError.new('Cannot verify SSL when target is an IP address. Set verify_ssl to false or use a fully qualified domain name.')
    end

    if port == nil
      port = 443
    end

    if verify_ssl == nil
      verify_ssl = false
    end

    # This establishes a connection using the minimum version supported by the SDK.
    e = Element.new(target, port, username, password, @min_version, verify_ssl)
    api = e.get_api

    if version == nil
      if api.current_version.to_f > @max_sdk_version # If the cluster supports the desired version, go ahead and do it.
        element = Element.new(target, port, username, password, @max_sdk_version, verify_ssl)
      else # If the cluster doesn't support the version you wanted, connect with the cluster's version.
        element = Element.new(target, port, username, password, api.current_version, verify_ssl)
      end
    else
      begin
        version_actual = version.to_f
      rescue
        raise SdkOperationError.new('Unable to determine version to connect from value: '+version)
      end
      if version_actual < min_sdk_version
        raise SdkOperationError.new('Cannot connect to a version lower than supported by the SDK. Connect at '+min_sdk_version.to_s+' or higher.')
      end
      supported_versions = []
      version_is_unsupported = true
      for api_version in api.supported_versions
        if api_version.to_f >= min_sdk_version
          supported_versions += [api_version]
          if version_actual == api_version.to_f
            version_is_unsupported = false
          end
        end
      end

      if version_is_unsupported
        raise SdkOperationError.new('Invalid version to connect on this cluster. Valid versions are '+supported_versions.join(','))
      else
        element = Element.new(target, port, username, password, version_actual, verify_ssl)
        if version_actual > @max_sdk_version
          @logger.warn('You have connected to a version that is higher than supported by this SDK. Some functionality may not work.')
        end
      end
    end
    @logger.info("Established connection to "+target)
    return element
  end
end