class SdkOperationError < RuntimeError
end

class ParameterError < RuntimeError
end

class ApiServiceError < RuntimeError
  attr_accessor :method_name, :json_error
  def initialize(method_name, error)
    self.method_name = method_name
    self.json_error = error
    super("Method Name: " + method_name + "; API Error: " + error.to_s)
  end
end