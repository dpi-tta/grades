class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  include Current::LtiProviderUserable
end
