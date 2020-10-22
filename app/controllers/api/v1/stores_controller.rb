class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]
 
  def show
  end

  def index
    return [] if params[:latitude].nil? || params[:longitude].nil?
  
    @stores = Store.within(params[:latitude].to_f, params[:longitude].to_f)
      .sort_by { |store| store.ratings_average }
      .reverse
  end
  
 
  private
 
  def set_store   
    @store = Store.find_by!(google_place_id: params[:id])
  end
end
