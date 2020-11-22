class SchemasController < ApplicationController
  def index
    @schemas = Schema.order(:name).all
  end

  def show
    @schema = Schema.find(params[:id])
  end
end
