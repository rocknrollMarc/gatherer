require "test_helper"


class ProjectTest < ActiveSupport::TestCase

  test "a project with no tasks is done" do
    project = Project.new
    assert(project.done?)
  end
  
  test "a project with an incomplete task is not done" do
    project = Project.new
    task = Task.new
    project.tasks << task
    refute(project.done?)
  end

  test "a completed task is complete" do
    task = Task.new
    refute(task.complete?)
    task.mark_completed
    assert(task.complete?)
  end

  test "a project is only done if all its tasks are done" do
    project = Project.new
    task = Task.new
    project.tasks << task
    refute(project.done?)
    task.mark_completed 
    assert(project.done?)
  end

end
