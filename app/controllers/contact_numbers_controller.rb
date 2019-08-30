class ContactNumbersController < ActionController::API

  # POST /contact_numbers
  # POST /contact_numbers.json
  def create
    @contact_number = if params[:number].present?
                        ContactNumber.new(contact_number_params)
                      else
                        generate_phone_number
                      end 


    respond_to do |format|
      if @contact_number.save
        format.html { redirect_to @contact_number, notice: 'Contact number was successfully created.' }
        format.json { render :show, status: :created, location: @contact_number }
      else
        format.html { render :new }
        format.json { render json: @contact_number.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_number_params
      params.require(:contact_number).permit(:number)
    end

    def generate_phone_number
      loop do
        number = rand(ContactNumber.START_RANGE..ContactNumber.END_RANGE)
        if number == ContactNumber.find_by(number: number)
          break
        end
      end
      ContactNumber.new(number: number)
    end
end
