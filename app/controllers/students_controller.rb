class StudentsController < ApplicationController

  def index
    render json: Student.all, status: :ok
  end

  def create
    student = Student.create!(student_params)
    if student.save!
      render json: student, status: :created
    else
      render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    students = Student.find(params[:id])
    if students
      render json: students, status: :ok
    else
      render json: {error: "student not found"}, status: :not_found
    end
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    if student.save!
      render json: student, status: :accepted
    else
      render json: {errors: not_found}, status: :not_found
    end

  end

  def destroy
    student = Student.find(params[:id])
    if student.destroy
      render json: {message: "succesfully deleted!"}, status: :ok
    else
      render json: {errors: not_found}, status: :not_found
    end
  end


  private


  def student_params
    params.required(:student).permit(:name, :age, :major, :instructor_id)
  end
end
