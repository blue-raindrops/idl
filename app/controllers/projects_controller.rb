class ProjectsController < ApplicationController
    def index
      @projects = Project.all
    end

    def show
      @projects = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        redirect_to @project
    end

    def project_params
      params.require(:project).permit(:title, :people, :description)
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        respond_to do |format|
            if @project.update(project_params)
                format.html {redirect_to @project, notice: 'Project was successfully updated.'}
                format.json {head :no_content}
            else
                format.html {render action: 'edit'}
                format.json {render json: @project.errors, status: :unprocessable_entity}
            end
        end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
  end

end
