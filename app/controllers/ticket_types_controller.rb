class TicketTypesController < ApplicationController
  protect_from_forgery
  def index
    @ticket_types = TicketType.all
    render json: @ticket_types
  end

  def show
    @ticket_type = TicketType.find_by_id(params[:id])
    render json: @ticket_type
  end

  def new
    @ticket_type = TicketType.new
  end

  def edit
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)
    @ticket_type.save
    render json: @ticket_type
  end

  def update
    respond_to do |format|
      if @ticket_type.update(params)
        render json: @ticket_type
      else
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_type.destroy
    render json: @users
  end

  def ticket_type_params
    params.permit(:event_id, :price, :ticket_zone_id)
  end
end
