class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only:[:edit, :update, :destroy, :show, :change]
	
	def index
		#@tasks = Task.all
		@to_do = current_user.tasks.where(state: 'to_do')
		@doing = current_user.tasks.where(state: 'doing')
		@done = current_user.tasks.where(state: 'done')

	end
	

	def new
		@task = Task.new
	end

	def create
		#@task = Task.new(tasks_params)
		@task = current_user.tasks.new(tasks_params)		
		if @task.save
			flash[:notice] = "Task created successfully."
			redirect_to task_path(@task)
		else
			render 'new'

		end
		
	end

	def edit
		
	end

	def update
		
		if @task.update(tasks_params)
			flash[:notice] = "Task updated successfully."
			redirect_to task_path(@task)
		else
			render 'edit'

		end
	end



	def show
		
	end

	def destroy
		
		@task.destroy
		flash[:notice] = "Task was successfully deleted."
		redirect_to tasks_path
	end


	def change
		@task.update_attributes(state: params[:state])
		flash[:notice] = "Status changed successfully."
		redirect_to tasks_path
	end

	private

	def set_task
		@task = Task.find(params[:id])
	end
	#whitelisting
	def tasks_params
		params.require(:task).permit(:content, :state)

	end

end