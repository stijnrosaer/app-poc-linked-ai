defmodule Dispatcher do
  use Matcher

  define_accept_types [
    html: ["text/html", "application/xhtml+html"],
    json: ["application/json", "application/vnd.api+json"],
  ]

  @any %{}
  @json %{
    accept: %{
      json: true
    }
  }
  @html %{
    accept: %{
      html: true
    }
  }

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule.
  #
  # docker-compose stop; docker-compose rm; docker-compose up
  # after altering this file.
  #
  # match "/themes/*path", @json do
  #   Proxy.forward conn, path, "http://resource/themes/"
  # end

  match "/data/*path" do
    Proxy.forward conn, path, "http://dataconvert/data/"
  end

  match "/jobs/*path" do
    Proxy.forward conn, path, "http://jobs/jobs/"
  end
  match "/label/*path" do
    Proxy.forward conn, path, "http://label-predictor/label"
  end

  match "/files/*path" do
    forward conn, path, "http://file/files/"
  end

  match "_", %{last_call: true} do
    send_resp(conn, 404, "Route not found.  See config/dispatcher.ex")
  end

  match "/files/*path" do
    forward conn, path, "http://file/files/"
  end

end
