class PortfolioController < ApplicationController
  before_filter :require_login, :except => [:index, :show]


end
