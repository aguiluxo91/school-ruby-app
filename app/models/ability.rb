# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new


    if user.is_a?(Admin)
      admin_abilities
    elsif user.is_a?(Teacher)
      teacher_abilities(user)
    elsif user.is_a?(Student)
      student_abilities(user)
    end

  end

  def admin_abilities
    can :manage, :all
  end


  def teacher_abilities(user)
    can :index, Teacher
    can :show, Teacher, id: user.id
    can :show, LessonPlan
    can :manage, Lesson, teacher_id: user.id
  end

  def student_abilities(user)
    can :index, Student
    can :show, Student, id: user.id
  end


    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
end
