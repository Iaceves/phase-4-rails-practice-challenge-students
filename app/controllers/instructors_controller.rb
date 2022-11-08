class InstructorsController < ApplicationController

  def index
    render json: Instructor.all, status: :ok
  end

  def create
  instructor = Instructor.new(instructor_params)
    if instructor.save!
      render json: instructor, status: :ok
    else
      render json: instructor.errors, status: '501'
    end
  end

  def show
    instructor = Instructor.find_by(id: params[:id])
    if instructor
      render json: instructor, status: :ok
    else
      render json: {error: "instructor not found"}, status: :not_found
    end
  end

  def update
    instructor = Instructor.find(id: params[:id])
    instructor.update(instructor_params)

    if instructor.save
      render json: instructor, status: :accepted
    else
      render json: instructor.errors, status: :not_found
    end
  end

  def destroy
    instructor = Instructor.find_by(id: params[:id])
    if instructor
     instructor.destroy
     render json: {message: "succesfully deleted!"}, status: :ok
    else
      render json: {error: "not found"}, status: :not_found
    end

  end

  private

  def instructor_params
    params.required(:instructor).permit(:name)
  end
end
