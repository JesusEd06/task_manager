class TasksController < ApplicationController
  before_action :require_login
  before_action :select_user, only: [:index, :new, :create]

  def index
    @tasks = @user.tasks # Obtener todas las tareas del usuario

    @group_tasks = []
    
    if @user.group.present?
      @group_tasks += @user.group.tasks
    end

    @tasks += @group_tasks # Combinar las tareas del usuario y las tareas de los grupos en una única lista

    # Puedes ordenar las tareas según tus requisitos, por ejemplo:
    # @tasks.sort_by!(&:due_date)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)
    @task.status = "false"
    @task.user_id = @user.id
    if @task.task_type == "grupal"
      @task.group_id = @user.group.id
    end

    if @task.save
      flash[:success] = "Task created"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def select_user
    @user = current_user
  end

  # strong params
  def task_params
    params.require(:task).permit(:name, :description, :due_date, 
      :status, :user_id, :group_id, :task_type)
  end
end
