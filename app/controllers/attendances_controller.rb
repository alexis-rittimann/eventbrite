class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new( user_id: current_user.id,
                                      event_id: params[:event_id])
  end

  def create
    # Amount in cents
    @amount = 500


    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_attendance_path
  end

end
