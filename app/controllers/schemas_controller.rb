class SchemasController < ApplicationController
  def index
    @schemas = Schema.order(:name).all
  end
end
