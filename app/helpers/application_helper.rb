module ApplicationHelper
  def application_base_url
    File.join(request.base_url, "/")
  end

  def application_api_url
    File.join(application_base_url, 'api')
  end
end
