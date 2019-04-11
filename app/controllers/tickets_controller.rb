class TicketsController < ApplicationController
  protect_from_forgery
  def index
    if params[:ticket_type_id]
      @tickets = TicketType.find(params[:ticket_type_id]).includes(:ticket_types).tickets
    else
      @tickets = Ticket.all
    end
    render json: @tickets
  end

  def show
    @ticket = Ticket.find_by_id(params[:id])
    render json: @ticket
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    render json: @ticket
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        render json: @ticket
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    render json: @ticket
  end

  def ticket_params
    params.permit(:ticket_type_id, :order_id)
  end
end
