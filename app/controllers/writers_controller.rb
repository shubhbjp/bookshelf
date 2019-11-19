class WritersController < ApplicationController
  before_action :set_writer, only: [:show, :edit, :update, :destroy]
  before_action :get_default_data
  # GET /writers
  # GET /writers.json
  def index
    @writers = Writer.all
  end

  # GET /writers/1
  # GET /writers/1.json
  def show
  end

  # GET /writers/new
  def new
    @writer = Writer.new
  end

  # GET /writers/1/edit
  def edit
  end

  # POST /writers
  # POST /writers.json
  def create
    @writer = Writer.new(writer_params)

    respond_to do |format|
      if @writer.save
        format.html { redirect_to @writer, notice: 'Writer was successfully created.' }
        format.json { render :show, status: :created, location: @writer }
      else
        format.html { render :new }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writers/1
  # PATCH/PUT /writers/1.json
  def update
    respond_to do |format|
      if @writer.update(writer_params)
        format.html { redirect_to @writer, notice: 'Writer was successfully updated.' }
        format.json { render :show, status: :ok, location: @writer }
      else
        format.html { render :edit }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writers/1
  # DELETE /writers/1.json
  def destroy
    @writer.destroy
    respond_to do |format|
      format.html { redirect_to writers_url, notice: 'Writer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writer
      @writer = Writer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def writer_params
      get_default_parameters
      params.require(:writer).permit(:name, :email, :mobile, :gender, :address, {:country => [:id, :name]}, {:state => [:id, :name]}, {:city => [:id, :name]}, :pincode, :isActive)
    end

    def get_default_data
       @countries = [['India', 1]];
       @states = [
          ['Andra Pradesh',1],
          ['Arunachal Pradesh',2],
          ['Assam',3],
          ['Bihar',4],
          ['Chhattisgarh',5],
          ['Goa',6],
          ['Gujarat',7],
          ['Haryana',8],
          ['Himachal Pradesh',9],
          ['Jammu and Kashmir',10],
          ['Jharkhand',11],
          ['Karnataka',12],
          ['Kerala',13],
          ['Madya Pradesh',14],
          ['Maharashtra',15],
          ['Manipur',16],
          ['Meghalaya',17],
          ['Mizoram',18],
          ['Nagaland',19],
          ['Orissa',20],
          ['Punjab',21],
          ['Rajasthan',22],
          ['Sikkim',23],
          ['Tamil Nadu',24],
          ['Telagana',25],
          ['Tripura',26],
          ['Uttaranchal',27],
          ['Uttar Pradesh',28],
          ['West Bengal',29]
      ];
      @cities = [['Kanpur', 1]];
    end

    def get_default_parameters
      @cities.each{
        |city| 
        if (city[1] == params['writer']['city'].to_i)
          params['writer']['city'] = Hash.new(0)
          params['writer']['city']['id'] = city[1].to_i
          params['writer']['city']['name'] = city[0].to_s
          break
        end        
      }
      
      @states.each{
        |state| 
        if (state[1].to_i == params['writer']['state'].to_i) 
          params['writer']['state'] = Hash.new(0)
          params['writer']['state']['id'] = state[1].to_i
          params['writer']['state']['name'] = state[0].to_s
          break
        end        
      }
      @countries.each{
        |country| 
        if (country[1].to_i == params['writer']['country'].to_i) 
          params['writer']['country'] = Hash.new(0)
          params['writer']['country']['id'] = country[1].to_i
          params['writer']['country']['name'] = country[0].to_s
          break;
        end        
      }
    end
end
