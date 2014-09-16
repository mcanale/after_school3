class PresencesController < ApplicationController
  before_action :set_params, :set_presences, only: [:new, :edit, :destroy]
  before_action :not_exist?, only: [:edit, :destroy]
  before_action :authenticate_user!

  def index
  end

  def new
  	if    params[:modify_button]
  	  redirect_to presences_edit_path(params)
  	elsif params[:destroy_button]
      redirect_to presences_destroy_path(params)
  	elsif @presences.present?
  	  redirect_to presences_show_path(params), notice: 'Presences already created.'
  	else
  	  students = Student.where(course_id: params[:course_id]).order(:surname, :name)
  	  @presences = []
  	  students.each do |student| 
	    @presences.push Presence.new(student_id: student.id, date: Date.parse(params[:date]))
	  end
  	end
  end

  def create
    params[:presences].values.each do |presence_data|
  		presence = Presence.new(
  			student_id: presence_data[:student_id],
  			date:       presence_data[:date],
  			user_id:    current_user.id,
  			present:    presence_data[:present],
  			note:       presence_data[:note],
  			toilet:     presence_data[:toilet]
  		)
  		presence.save
 		subjects_array = presence_data[:subject_ids].drop(1)
  		subjects_array.each do |sub_id|
  			PresencesSubjects.create(presence_id: presence.id, subject_id: sub_id)
  		end
    end
   	redirect_to presences_show_path(params), notice: 'Presences was successfully created.'
  end

  def edit
  end

  def update
    params[:presences].values.each do |presence_data|
  		presence = Presence.find(presence_data[:id])
   		presence.update(user_id: current_user.id, present: presence_data[:present], note: presence_data[:note], toilet: presence_data[:toilet])
  		
  		PresencesSubjects.where(presence_id: presence.id).delete_all
  		subjects_array = presence_data[:subject_ids].drop(1)
  		subjects_array.each do |sub_id|
  			PresencesSubjects.create(presence_id: presence.id, subject_id: sub_id)
  		end
  	end
  	redirect_to presences_show_path(params), notice: "Presences was successfully updated."
  end

  def destroy
	@presences.each do |presence|
	  PresencesSubjects.where(presence_id: presence.id).delete_all
	end
    @presences.delete_all
    redirect_to presences_show_path(params), notice: 'Presences was successfully deleted.'
  end

  def show
  end

private

  def set_params
    params.permit(:course_id, :date)
    @course = Course.find(params[:course_id])
    @date = Date.parse(params[:date])
  end

  def set_presences
  	@presences = Presence.joins(:student).where(students: {course_id: params[:course_id]},
												                      date: params[:date])
  end

  def not_exist?
    if @presences.empty? 
	    redirect_to presences_show_path, notice: "Presences doesn't exists."
	  end
  end

end

