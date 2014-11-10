class PeopleController < ApplicationController
  def index
      @people = Person.all
    end

    def show
      @person = Person.find(params[:id])
      respond_to do |format|
          format.html
          format.json {render json: @user}
        end
    end

    def new
        @person = Person.new
    end

    def create
        @person = Person.create(person_params)
        redirect_to @person
    end

    def person_params
      params.require(:person).permit(:name, :title, :site, :contact, :projects)
    end

    def edit
        @person = Person.find(params[:id])
    end

    def update
        @person = Person.find(params[:id])
        respond_to do |format|
            if @person.update(person_params)
                format.html {redirect_to @person, notice: 'Person was successfully updated.'}
                format.json {head :no_content}
            else
                format.html {render action: 'edit'}
                format.json {render json: @person.errors, status: :unprocessable_entity}
            end
        end
    end
end
