class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(tasks_params)
		if @task.save
			flash[:notice] = "Task created successfully."
			redirect_to task_path(@task)
		else
			render 'new'

		end
		
	end

	def show
		@task = Task.find(params[:id])
		

	end

	private
	#whitelisting
	def tasks_params
		params.require(:task).permit(:content)

	end

end